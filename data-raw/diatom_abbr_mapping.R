#DIATOM ------------------------------------------------------------------

data(diatom_species)

diatom_code_abbr_mapping <-
   tibble::tibble(
     alt = diatom_species$code,
     code = diatom_species$code
   ) %>%
   dplyr::filter(code != "") %>%
   dplyr::arrange(code) %>%
   tibble::deframe()

diatom_code_abbr_mapping
usethis::use_data(diatom_code_abbr_mapping, overwrite = TRUE)


