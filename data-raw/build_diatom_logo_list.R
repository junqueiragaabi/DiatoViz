#' Diatom Logo List
#'
#' A named list of file paths to diatom species logos. Each element is indexed
#' by a species code.
#'
#' @format A named list. Names are species codes, values are file paths.
#' @source Generated from image files in `inst/`.
"diatom_logo_list"


logo_dir <- "inst"

logo_files <- list.files(logo_dir, full.names = TRUE)

diatom_codes <- tools::file_path_sans_ext(basename(logo_files))

diatom_logo_list <- rlang::set_names(as.list(logo_files), diatom_codes)

usethis::use_data(diatom_logo_list, overwrite = TRUE)


