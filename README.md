
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggalignment

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
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
align_cats <- ggalignment::align_cats()
align_cats
#>                   img       alignment
#> 1   inst/img/obie.png    chaotic evil
#> 2 inst/img/jeff 2.png  lawful neutral
#> 3  inst/img/jerry.png    chaotic good
#> 4 inst/img/gray 3.png chaotic neutral
```

``` r
ggalignment(align_cats, font_size = 3)
```

<img src="man/figures/README-example-chart-1.png" width="100%" />
