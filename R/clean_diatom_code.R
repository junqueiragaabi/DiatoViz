# Extracted from nflreadr/nbaplotR and slightly modified

#' Standardize Brazilian Soccer Team Abbreviations
#'
#' This function standardizes Brazilian Soccer team abbreviations to brasileirao defaults.
#'
#' @param code a character vector of abbreviations
#' @param keep_non_matches If `TRUE` (the default) an element of `abbr` that can't
#'   be matched to any of the internal mapping vectors will be kept as is. Otherwise
#'   it will be replaced with `NA`.
#'
#' @return A character vector with the length of `abbr` and cleaned team abbreviations
#'   if they are included in [`team_abbr_mapping`].
#'   Non matches may be replaced with `NA` (depending on the value of `keep_non_matches`).
#' @export
clean_diatom_code <- function(code,
                             keep_non_matches = TRUE) {
  stopifnot(is.character(code))

  m <- diatom_code_abbr_mapping

  a <- unname(m[toupper(code)])

  if (any(is.na(a)) && getOption("DiatoViz.verbose", default = interactive())) {

    map <- "diatom_code_abbr_mapping"

    cli::cli_warn("Sorry, the Diatom code not found in {.code {map}}: {utils::head(code[is.na(a)], 10)}")
  }

  if (isTRUE(keep_non_matches)) a <- ifelse(!is.na(a), a, code)

  a
}

# internal helper that outputs local path to badge files
shape_from_code <- function(code){

  system.file(paste0("/", code, ".svg"), package = "DiatoViz")

}
