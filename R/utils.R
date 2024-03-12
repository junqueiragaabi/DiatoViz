#' Output Valid Brazilian Soccer Team Abbreviations
#'
#' @param type One of `"code"` or `"species"`
#' @export
#' @return A vector of type `"character"`.
#' @examples
#' # List valid Brazilian soccer team abbreviations
#' valid_diatom_code("code")
#'
#' #' # List valid Brazilian soccer team abbreviations
#' valid_diatom_code("species")

valid_diatom_code <- function(type = c("code", "species")){
  type <- rlang::arg_match0(type = c("code", "species"))
  map <- switch (type,
    "code" = DiatoViz::diatom_code_abbr_mapping,
    "species" = DiatoViz::diatom_sp_abbr_mappingg
  )
  n <- sort(unique(map))
  n
}


# Extracted from nflreadr/nbaplotR and slightly modified

#' Standardize Brazilian Soccer Team Abbreviations
#'
#' This function standardizes Brazilian Soccer team abbreviations to brasileirao defaults.
#'
#' @param abbr a character vector of abbreviations
#' @param type One of `"code"` or `"species"`
#' @param keep_non_matches If `TRUE` (the default) an element of `abbr` that can't
#'   be matched to any of the internal mapping vectors will be kept as is. Otherwise
#'   it will be replaced with `NA`.
#'
#' @return A character vector with the length of `abbr` and cleaned team abbreviations
#'   if they are included in [`diatom_code_abbr_mapping`] or [`diatom_sp_abbr_mapping`].
#'   Non matches may be replaced with `NA` (depending on the value of `keep_non_matches`).
#' @export


clean_diatom_code <- function(abbr,
                             type = c("code", "species"),
                             keep_non_matches = TRUE) {
  stopifnot(is.character(abbr))
  type <- rlang::arg_match0(type, c("code", "species"))

  m <- switch (type,
               "code" = DiatoViz::diatom_code_abbr_mapping,
               "species" = DiatoViz::diatom_sp_abbr_mapping
  )

  a <- unname(m[toupper(abbr)])

  if (any(is.na(a)) && getOption("DiatoViz.verbose", default = interactive())) {
    map <- switch (type,
                   "code" = "DiatoViz::diatom_code_abbr_mapping",
                   "species" = "DiatoViz::diatom_sp_abbr_mapping"
    )
    cli::cli_warn("Abbreviations not found in {.code {map}}: {utils::head(abbr[is.na(a)], 10)}")
  }

  if (isTRUE(keep_non_matches)) a <- ifelse(!is.na(a), a, abbr)

  a
}


# internal helper that outputs local path to badge files
shape_from_diatom <- function(abbr, type = c("code", "species")){
  img_vctr <- paste0(type, "/", abbr, ".svg")
  # This used to call the following system.file line
  # but it drops non matches which results in errors
  # system.file(img_vctr, package = "nbaplotR")

  # Now we use some code from system.file but keep the non matches
  packagePath <- find.package("DiatoViz", quiet = TRUE)
  img_files <- file.path(packagePath, img_vctr)
  present <- file.exists(img_files)
  img_files[!present] <- img_vctr[!present]

  img_files
}



