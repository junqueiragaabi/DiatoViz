diatom_sp_abbr_mapping <-
   tibble::tibble(
     alt = diatom_species$species,
     sp = diatom_species$species
   ) %>%
   dplyr::arrange(sp) %>%
   tibble::deframe()


usethis::use_data(diatom_sp_abbr_mapping, overwrite = TRUE)

#' Alternate WNBA Team Abbreviation Mapping
#'
#' A named character vector mapping common alternate team abbreviations.
#'

#'
#' @examples
#' \donttest{
#' diatom_sp_abbr_mapping[c("CONN", "DAL", "SEA")]
#' }
#'
#' @format A named character vector
#' \describe{
#'   \item{name attribute}{The "alternate" name.}
#'   \item{value attribute}{The "correct" name.}
#' }
"diatom_sp_abbr_mapping"

