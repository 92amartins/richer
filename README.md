
<!-- README.md is generated from README.Rmd. Please edit that file -->

# convexity

<!-- badges: start -->

![convexity-ci](https://github.com/92amartins/convexity/workflows/ci/badge.svg)
[![codecov](https://codecov.io/gh/92amartins/convexity/branch/master/graph/badge.svg?token=0DPGPGX98O)](https://codecov.io/gh/92amartins/convexity)
<!-- badges: end -->

Useful functions for stock market investments.

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
#> 3488 2021-01-28 88.20 91.35 88.10 91.10
#> 3489 2021-01-29 89.99 90.85 87.83 88.67
#> 3490 2021-02-01 90.01 91.27 88.58 91.27
#> 3491 2021-02-02 90.18 90.58 87.51 87.66
#> 3492 2021-02-03 88.85 91.42 88.60 90.43
#> 3493 2021-02-04 91.95 92.87 89.09 89.29
```

You can also get an investment hint for a specific stock by calling the
function `hint()`.

``` r
hint("VALE3.SA")
#> [1] "buy"
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
