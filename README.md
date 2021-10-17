
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gdataopenAPI

<!-- badges: start -->
<!-- badges: end -->

공공데이터에서 제공하는 openAPI를 더 쉽게 사용하기 위한 패키지입니다.

## 패키지설치 및 로딩

``` r
# packages loading
remotes::install_github("nackta/gdataopenAPI")
```

``` r
library(gdataopenAPI)
```

## 지원중인 openAPI목록

### 1. 관세청 품목별 국가별 수출입실적

``` r
getNitemtradeList(ServiceKey='yourkey', startpoint='202001', endpoint='202012', hscode='3304', country='US')
```

    #> # A tibble: 13 x 10
    #>    balPayments    expDlr expWgt hsCd  impDlr impWgt statCd statCdCntnKor1 statKor
    #>          <int>     <int>  <int> <chr>  <int>  <int> <chr>  <chr>          <chr>  
    #>  1    13827900  29343051 1.32e6 3304  1.55e7 4.33e5 US     미국           "미용~ 
    #>  2     7899525  27932164 1.27e6 3304  2.00e7 5.06e5 US     미국           "미용~ 
    #>  3    20190333  37189582 1.64e6 3304  1.70e7 4.62e5 US     미국           "미용~ 
    #>  4    19614906  37774522 1.80e6 3304  1.82e7 5.05e5 US     미국           "미용~ 
    #>  5    20297727  34845351 1.50e6 3304  1.45e7 3.66e5 US     미국           "미용~ 
    #>  6    25435268  41711700 2.07e6 3304  1.63e7 4.56e5 US     미국           "미용~ 
    #>  7    33602037  48370578 2.16e6 3304  1.48e7 4.59e5 US     미국           "미용~ 
    #>  8    25729249  40327681 1.99e6 3304  1.46e7 3.99e5 US     미국           "미용~ 
    #>  9    28782301  47980403 2.07e6 3304  1.92e7 5.29e5 US     미국           "미용~ 
    #> 10    24491567  41093132 1.91e6 3304  1.66e7 5.02e5 US     미국           "미용~ 
    #> 11    28088703  48290610 2.11e6 3304  2.02e7 4.54e5 US     미국           "미용~ 
    #> 12    31484800  48245711 2.04e6 3304  1.68e7 4.08e5 US     미국           "미용~ 
    #> 13   279444316 483104485 2.19e7 -     2.04e8 5.48e6 -      -              "-"    
    #> # ... with 1 more variable: year <chr>

각 변수에 대한 설명은 [공공데이터
포털](https://www.data.go.kr/index.do)을 확인해주세요.
