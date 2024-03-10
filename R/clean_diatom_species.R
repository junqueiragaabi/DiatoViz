# Extracted from nflreadr/nbaplotR and slightly modified

#' Standardize Brazilian Soccer Team Abbreviations
#'
#' This function standardizes Brazilian Soccer team abbreviations to brasileirao defaults.
#'
#' @param species a character vector of abbreviations
#' @param keep_non_matches If `TRUE` (the default) an element of `abbr` that can't
#'   be matched to any of the internal mapping vectors will be kept as is. Otherwise
#'   it will be replaced with `NA`.
#'
#' @return A character vector with the length of `abbr` and cleaned team abbreviations
#'   if they are included in [`team_abbr_mapping`].
#'   Non matches may be replaced with `NA` (depending on the value of `keep_non_matches`).
#' @export
clean_diatom_species <- function(species,
                             keep_non_matches = TRUE) {
  stopifnot(is.character(species))

  m <- diatom_sp_abbr_mapping

  a <- unname(m[toupper(species)])

  if (any(is.na(a)) && getOption("DiatoViz.verbose", default = interactive())) {

    map <- "DiatoViz::diatom_sp_abbr_mapping"

    cli::cli_warn("Sorry, the Diatom species not found in {.code {map}}: {utils::head(code[is.na(a)], 10)}")
  }

  if (isTRUE(keep_non_matches)) a <- ifelse(!is.na(a), a, species)

  a
}

# internal helper that outputs local path to badge files
shape_from_species <- function(species){

  system.file(paste0("/inst/species", species, ".svg"), package = "DiatoViz")

}


