
<!-- README.md is generated from README.Rmd. Please edit that file -->

# convexity

<!-- badges: start -->

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
#>            VALE3.SA.Open VALE3.SA.High VALE3.SA.Low VALE3.SA.Close
#> 2020-09-11         60.05         62.30        59.84          61.95
#> 2020-09-14         62.80         63.35        61.38          61.91
#> 2020-09-15         62.71         63.65        62.15          62.60
#> 2020-09-16         62.32         62.50        60.65          60.97
#> 2020-09-17         60.40         62.42        60.11          62.08
#> 2020-09-18         62.48         63.10        61.66          61.66
#>            VALE3.SA.Volume
#> 2020-09-11        46057000
#> 2020-09-14        35710200
#> 2020-09-15        32570600
#> 2020-09-16        28843500
#> 2020-09-17        31397500
#> 2020-09-18        33143800
```

You can also get an investment hint for a specific stock by calling the
function `hint()`.

``` r
hint("VALE3.SA")
#> [1] "buy"
```
