
# ralph

<!-- badges: start -->
<!-- badges: end -->

The goal of ralph is to Compute tidy correlations between two variables of a data

## Installation

You can install the development version of ralph from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("shafayetShafee/ralph")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ralph)
compute_corr(data=faithful, var1=eruptions, var2 = waiting)
```

