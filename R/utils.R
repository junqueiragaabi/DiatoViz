#' Output diatoms codes
#'
#' @description The abbreviations used in this function are the same as those used by the omnidia software
#'
#' @export
#' @return A vector of type `"character"`.

valid_diatom_code <- function(){
  map <- DiatoViz::diatom_code_abbr_mapping
  n <- sort(unique(map))
  n
}


# Extracted from nflreadr/nbaplotR and slightly modified

#' Standardize diatoms code
#'
#' This function standardizes diatoms code.
#'
#' @param code a character vector of abbreviations
#' @param keep_non_matches If `TRUE` (the default) an element of `code` that can't
#'   be matched to any of the internal mapping vectors will be kept as is. Otherwise
#'   it will be replaced with `NA`.
#'
#' @return A character vector with the length of `code` and cleaned the diatoms code
#'   if they are included in [`diatom_code_abbr_mapping`].
#'   Non matches may be replaced with `NA` (depending on the value of `keep_non_matches`).
#' @export
clean_diatom_code <- function(code,
                              keep_non_matches = TRUE) {
  stopifnot(is.character(code))

  m <- DiatoViz::diatom_code_abbr_mapping

  a <- unname(m[toupper(code)])

  if (any(is.na(a)) && getOption("DiatoViz.verbose", default = interactive())) {

    map <- "DiatoViz::diatom_code_abbr_mapping"

    cli::cli_warn("Diatom not found in {.code {map}}: {utils::head(code[is.na(a)], 10)}")
  }

  if (isTRUE(keep_non_matches)) a <- ifelse(!is.na(a), a, code)

  a
}


# internal helper that outputs local path to silhouettes files
shape_from_diatom <- function(code){

  img_vctr <- paste0("inst/", code, ".png")



  packagePath <- find.package("DiatoViz", quiet = TRUE)
  img_files <- file.path(packagePath, img_vctr)
  present <- file.exists(img_files)
  img_files[!present] <- img_vctr[!present]

  img_files

}




