
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DiatoViz

<!-- badges: start -->
<!-- badges: end -->

`DiatoViz` is an R package developed for diatomists.

The `DiatoViz` package provides a simple function to add silhouettes of
diatoms to plots generated `ggplot2`. Currently, the package contains 87
diatom silhouettes. The silhouettes of diatoms were created using the
[**SHERPA**](https://www.uni-due.de/phykologie/sherpa) software (Kloster
et al. 2014).

## Installation

You can install the development version of `DiatoViz` from
[GitHub](https://github.com/) with R package
[**devtools**](https://cran.r-project.org/package=devtools):

``` r
install.packages("devtools")
devtools::install_github("junqueiragaabi/DiatoViz")
```

## How does it work?

To use Diatoviz, your species list must be formatted with the specific
abbreviations provided by the [**Omnidia**](https://omnidia.fr/en/)
software. The main function `geom_diatom_code()` geometry draws diatom
species shapes. Here you can see some the current available diatoms to
plot. Atualmente o pacote tem 87 siluetas de diatomaceas.

``` r
library(tidyverse)
library(DiatoViz)

## basic example code

diatoms <- DiatoViz::valid_diatom_code()

df_example <- data.frame(
  a = c(rep(1:5, 16),c(1,2,3,4,5, 6, 7, 8, 9)),
  b = sort(c(rep(1:16, 5), c(0,0,0,0,0,0,0,0,0)), decreasing = TRUE),
  species = diatoms) %>%
  slice(1:30)

ggplot(df_example, aes(x = a, y = b)) +
  geom_diatom_code(aes(diatom_code = species), width = 0.5) +
  geom_label(aes(label = species), nudge_y = -0.45) +
  theme_void()+
  theme(plot.margin = margin(15,15,15,15,"pt"))+
  coord_cartesian(clip = "off")
```

<img src="man/figures/README-plot-1.png" width="100%" />

## :orange_heart: Contribution

Can’t find the diatom you want?

Contributions to `DiatoViz` package are welcome!

Please contact [Gabriela Junqueira](mailto:mgjn.junqueira@gmail.com) or
submit a pull request.

## Credits

We extend our gratitude to [Sebastian Carl](https://github.com/mrcaseb)
for his creation of the nflplotR and nbaplotR packages, which played a
crucial role in shaping `DiatoViz`.

## References

Kloster M., Kauer G. & Beszteri B. (2014): SHERPA: an image segmentation
and outline feature extraction tool for diatoms and other objects. BMC
Bioinformatics 15:218.
