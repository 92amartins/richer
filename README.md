
<!-- README.md is generated from README.Rmd. Please edit that file -->

# convexity

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/92amartins/convexity/branch/master/graph/badge.svg)](https://codecov.io/gh/92amartins/convexity?branch=master)
<!-- badges: end -->

The goal of convexity is to provide hints for stock market investments.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("92amartins/convexity")
```

## Examples

Here are some use cases supported by the package.

Using the `stock()` function, you get back a `data.frame` suitable for
any financial analysis.

``` r
library(convexity)

vale = stock("VALE3.SA")
#> Registered S3 method overwritten by 'quantmod':
#>   method            from
#>   as.zoo.data.frame zoo
#> 'getSymbols' currently uses auto.assign=TRUE by default, but will
#> use auto.assign=FALSE in 0.5-0. You will still be able to use
#> 'loadSymbols' to automatically load data. getOption("getSymbols.env")
#> and getOption("getSymbols.auto.assign") will still be checked for
#> alternate defaults.
#> 
#> This message is shown once per session and may be disabled by setting 
#> options("getSymbols.warning4.0"=FALSE). See ?getSymbols for details.

tail(vale)[1:5]
#>            Date  Open  High   Low Close
#> 3454 2020-12-04 80.10 82.68 80.10 82.27
#> 3455 2020-12-07 82.42 82.99 81.67 82.95
#> 3456 2020-12-08 82.97 83.30 81.66 82.90
#> 3457 2020-12-09 83.10 83.83 82.22 82.70
#> 3458 2020-12-10 83.65 85.22 83.20 85.00
#> 3459 2020-12-11 84.62 85.28 84.40 84.76
```

You can also get an investment hint for a specific stock by calling the
function `hint()`.

``` r
hint("VALE3.SA")
#> [1] "buy"
```
