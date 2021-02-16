
<!-- README.md is generated from README.Rmd. Please edit that file -->

# richer

<!-- badges: start -->

![build](https://github.com/92amartins/richer/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/92amartins/richer/branch/master/graph/badge.svg?token=0DPGPGX98O)](https://codecov.io/gh/92amartins/richer)
<!-- badges: end -->

Useful functions for stock market investments.

## Installation

You can install the development version from
[GitHub](https://github.com/92amartins/richer) with:

``` r
# install.packages("devtools")
devtools::install_github("92amartins/richer")
```

## Examples

Here are some use cases supported by the package.

Using the `stock()` function, you get back a `data.frame` suitable for
any financial analysis.

``` r
library(richer)

vale = stock("VALE3.SA")

head(vale)
#>         Date   Open   High    Low  Close  Volume Adjusted
#> 1 2007-01-02 31.850 32.700 31.850 32.700  739800 20.49837
#> 2 2007-01-03 32.255 32.400 30.795 31.100 4913000 19.49539
#> 3 2007-01-04 31.000 31.250 30.150 30.600 2638600 19.18195
#> 4 2007-01-05 30.540 30.595 29.100 29.300 3246000 18.36704
#> 5 2007-01-08 29.500 30.400 29.500 30.400 2050600 19.05658
#> 6 2007-01-09 30.430 30.700 29.155 29.625 2368200 18.57076
```

You can also get an investment hint for a specific stock by calling the
function `hint()`.

``` r
hint("VALE3.SA")
#> [1] "sell"
```

## Related Packages

`GetHFData` have long been my first choice for fetching trading data,
but the package does not work anymore as of early 2020 because of a
issue with with the B3’s FTP service.

> *2020-06-30 IMPORTANT: B3 closed the public access to the ftp site
> and, therefore, the package is not working. As far as I know, there is
> no expectation of any change in that status in the near future. I’m
> also not aware of any other source of HF data.*

So, we headed our attention to `quantmod` which fetches data from
multiple sources:

> *quantmod is an R package that provides a framework for quantitative
> financial modeling and trading. It provides a rapid prototyping
> environment that makes modeling easier by removing the repetitive
> workflow issues surrounding data management and visualization.*

## Acknowledgments

Thanks to Rodrigo Bonisem for initial discussions on this project.
