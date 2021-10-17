
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

| idx | balPayments |   expDlr |  expWgt | hsCd |   impDlr | impWgt | statCd | statCdCntnKor1 | statKor                                                                                                                                                                     | year    |
|----:|------------:|---------:|--------:|:-----|---------:|-------:|:-------|:---------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------|
|   1 |    13827900 | 29343051 | 1317423 | 3304 | 15515151 | 433220 | US     | 미국           | 미용이나 메이크업용 제품류와 기초화장용 제품류\[의약품은 제외하며, 선스크린(sunscreen)과 선탠(sun tan) 제품류를 포함한다\], 매니큐어용 제품류와 페디큐어(pedicure)용 제품류 | 2020.01 |
|   2 |     7899525 | 27932164 | 1273597 | 3304 | 20032639 | 506397 | US     | 미국           | 미용이나 메이크업용 제품류와 기초화장용 제품류\[의약품은 제외하며, 선스크린(sunscreen)과 선탠(sun tan) 제품류를 포함한다\], 매니큐어용 제품류와 페디큐어(pedicure)용 제품류 | 2020.02 |

각 변수에 대한 설명은 [공공데이터
포털](https://www.data.go.kr/index.do)을 확인해주세요.
