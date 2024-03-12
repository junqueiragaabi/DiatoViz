#DIATOM ------------------------------------------------------------------

diatom_code_abbr_mapping <-
   tibble::tibble(
     alt = diatom_species$code,
     code = diatom_species$code
   ) %>%
   dplyr::arrange(code) %>%
   tibble::deframe()


usethis::use_data(diatom_code_abbr_mapping, overwrite = TRUE)

diatom_sp_abbr_mapping <-
   tibble::tibble(
     alt = diatom_species$species,
     sp = diatom_species$species
   ) %>%
   dplyr::arrange(sp) %>%
   tibble::deframe()


usethis::use_data(diatom_sp_abbr_mapping, overwrite = TRUE)
