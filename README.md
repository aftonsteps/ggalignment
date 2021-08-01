
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggalignment

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-CMD-check](https://github.com/aftonsteps/ggalignment/workflows/R-CMD-check/badge.svg)](https://github.com/aftonsteps/ggalignment/actions)
<!-- badges: end -->

The goal of ggalignment is to do one thing – create DnD-style alignment
charts! These charts range from lawful to neutral to chaotic in one
dimension, and good to neutral to evil in the other. Pictures or text
can be placed in each of boxes to indicate the alignment.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("aftonsteps/ggalignment")
```

## Example

This is a basic example which shows you how to use ggalignment:

``` r
library(ggalignment)
align_cats <- align_cats
align_cats
#>                                                                    img
#> 1  C:/Users/afton/Documents/R/win-library/3.6/ggalignment/img/obie.png
#> 2 C:/Users/afton/Documents/R/win-library/3.6/ggalignment/img/jerry.png
#> 3  C:/Users/afton/Documents/R/win-library/3.6/ggalignment/img/gray.png
#> 4  C:/Users/afton/Documents/R/win-library/3.6/ggalignment/img/jeff.png
#>         alignment
#> 1    chaotic evil
#> 2  lawful neutral
#> 3    chaotic good
#> 4 chaotic neutral
```

``` r
ggalignment(align_cats, font_size = 3)
```

<img src="man/figures/README-example-chart-1.png" width="100%" />
