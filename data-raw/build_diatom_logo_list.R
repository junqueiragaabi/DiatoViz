# Build diatom logo list

logo_dir <- "inst"

logo_files <- list.files(logo_dir, full.names = TRUE)

diatom_codes <- tools::file_path_sans_ext(basename(logo_files))

diatom_logo_list <- rlang::set_names(as.list(logo_files), diatom_codes)

usethis::use_data(diatom_logo_list, internal = TRUE, overwrite = TRUE)


