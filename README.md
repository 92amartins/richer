
<!-- README.md is generated from README.Rmd. Please edit that file -->

# convexity

<!-- badges: start -->

![convexity-ci](https://github.com/92amartins/convexity/workflows/ci/badge.svg)
[![codecov](https://codecov.io/gh/92amartins/convexity/branch/master/graph/badge.svg?token=0DPGPGX98O)](https://codecov.io/gh/92amartins/convexity)
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

tail(vale)[1:5]
#>            Date  Open  High   Low Close
#> 3480 2021-01-15 96.58 97.20 93.51 93.85
#> 3481 2021-01-18 93.90 95.64 93.55 94.31
#> 3482 2021-01-19 94.50 94.57 91.90 94.06
#> 3483 2021-01-20 95.00 95.14 90.83 92.32
#> 3484 2021-01-21 92.30 96.10 92.14 93.36
#> 3485 2021-01-22 91.99 93.00 90.99 92.63
```

You can also get an investment hint for a specific stock by calling the
function `hint()`.

``` r
hint("VALE3.SA")
#> [1] "buy"
```

## Acknowledgments

Thanks to Rodrigo Bonisem for initial discussions on this project.
