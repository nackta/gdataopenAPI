expimp_data <- function(ServiceKey, startpoint, endpoint, hscode, country){
    url <- paste0("http://openapi.customs.go.kr/openapi/service/newTradestatistics/getNitemtradeList?ServiceKey=", ServiceKey,
                  "&searchBgnDe=", startpoint,
                  "&searchEndDe=", endpoint,
                  "&searchItemCd=", hscode,
                  "&searchStatCd=", country)
    xml_expimp <- read_xml(url) %>% xml_children() %>% xml_children() %>% xml_children()
    tmp1 <- lapply(seq_along(xml_expimp),
                   function(x){
                       temp_row <- xml_find_all(xml_expimp[x], './*')
                       tibble(idx = x,
                              key = temp_row %>% xml_name(),
                              value = temp_row %>% xml_text()
                       ) %>% return()
                   }
    )
    tmp2 <- bind_rows(tmp1)
    spread(tmp2,key,value) %>% return()
}
