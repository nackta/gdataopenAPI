#' getNitemtradeList
#'
#' \code{getNitemtradeList} returns Import/Export Performance by Item and Country.
#'
#' This function return Import/Export Performance by Item and Country.
#'
#' @param ServiceKey your service key.
#' @param startpoint year,month. character
#' @param endpoint year,month. character
#' @param hscode 4-digit hscode. character
#' @param country country code.
#' @examples
#' getNitemtradeList('yourservicekey', '202001', '202012', '3304', 'US')
#' @export
#' @import xml2
#' @import dplyr
#' @importFrom tibble tibble
#' @importFrom magrittr %>%
#' @importFrom tidyr spread


getNitemtradeList <- function(ServiceKey, startpoint, endpoint, hscode, country){
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
