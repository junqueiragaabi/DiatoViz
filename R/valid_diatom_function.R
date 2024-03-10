#' Output valid diatoms omninida codes
#'
#'
#' @export
#' @return A vector of type `"character"`.
#' @examples
#' # List valid diatoms omninida codes
#' valid_diatom_code()

valid_diatom_code <- function(){
  map <- diatom_code_abbr_mapping
  n <- sort(unique(map))
  n
}

#' Output valid diatoms species
#'
#'
#' @export
#' @return A vector of type `"character"`.
#' @examples
#' # List valid diatom species
#' valid_diatom_species()


valid_diatom_species <- function(){
  map <- diatom_sp_abbr_mapping
  n <- sort(unique(map))
  n
}
