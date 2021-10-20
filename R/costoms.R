#' request one api
#'
#' @param ServiceKey your service key.
#' @param startpoint year,month. character
#' @param endpoint year,month. character
#' @param hscode 4-digit hscode. character
#' @param country country code.
#'
one_getNitemtradeList <- function(ServiceKey, startpoint, endpoint, hscode, country){
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
#' @import xml2
#' @import dplyr
#' @importFrom tibble tibble
#' @importFrom tidyr spread
#' @importFrom lubridate ymd
#' @export
getNitemtradeList <- function(ServiceKey, startpoint='202001', endpoint='202012', hscode='3304', country='US'){
    startmonth <- seq(from = ymd(paste0(startpoint, "01")),
                      to = ymd(paste0(endpoint, "01")),
                      by = '1 month')
    startmonth <- format(startmonth, '%Y%m')
    data <- tibble()
    for(i in 0:(length(startmonth)%/%12)){
        if(i == (length(startmonth)%/%12)){
            tmpdata <- one_getNitemtradeList(ServiceKey=ServiceKey, startpoint=startmonth[1+12*i], endpoint=tail(startmonth, n=1), hscode=hscode, country=country)
            tmpdata <- tmpdata[1:(nrow(tmpdata)-1),]
            data <- bind_rows(data, tmpdata)
        }
        else{
            tmpdata <- one_getNitemtradeList(ServiceKey=ServiceKey, startpoint=startmonth[1+12*i], endpoint=startmonth[12+12*i], hscode=hscode, country=country)
            tmpdata <- tmpdata[1:(nrow(tmpdata)-1),]
            data <- bind_rows(data, tmpdata)
        }
    }
    return(data)
}

