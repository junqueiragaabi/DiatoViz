## create a package
## available name

usethis::use_mit_license()


install.packages("magick")

library(magick)
library(tidyverse)


diatom <- magick::image_read("C:/Users/mgjun/Documents/DiatoViz/teste.tif")
print(diatom)

diatom_svg <- image_convert(diatom, "svg")

diatom_svg

image_write(diatom_svg, "output_file.svg")

# Read TIFF files
tiff_files <- list.files(path = "./ADIAC", pattern = ".tif", full.names = TRUE)

tiff_files[[1]]

# Loop over each TIFF file
for (tiff_file in seq_along(tiff_files)) {
  # Read the TIFF file
  img <- magick::image_read(tiff_files[[tiff_file]])

   output_file <- paste0(tools::file_path_sans_ext(tiff_files[[tiff_file]]), ".svg")

  # Convert TIFF to SVG
  svg <- magick::image_convert(img, format = "svg")

  # Write SVG to file
  magick::image_write(svg, path = output_file, format = ".svg")
}


all_files <- list.files(path = "./ADIAC", pattern = ".tif", full.names = T)

class(all_files)

species_images <- all_files %>%
  sub(".*/([^/]+)\\.\\w+$", "\\1", .) %>%
  sub("\\.\\w+$", "", .) %>%
  gsub(" ", "_", .) %>%
  gsub('"', '', .)

df_images <- tibble(
  n = seq(1:307),
  species = species_images,

)


write.csv(df_images, "species_images.csv")

list_ominidia <- read.csv("species_images.csv", header = TRUE, sep = ";", dec = ",") %>%
  as_tibble()


diatom_species <- list_ominidia %>%
  mutate(Genus = str_extract(species, "^[^_]+"))


usethis::use_data(diatom_species)

species_images

diretorio <- "./ADIAC"

arquivos_svg <- list.files(path = "./ADIAC", pattern = ".svg", full.names = T)

for (arquivo in arquivos_svg) {
  # Extrair o nome do arquivo sem extensão
  nome_sem_extensao <- tools::file_path_sans_ext(basename(arquivo))

  # Substituir espaços por underline
  nome_sem_extensao <- gsub(" ", "_", nome_sem_extensao)

  # Remover números e caracteres especiais
  nome_sem_extensao <- gsub("[[:digit:]]", "", nome_sem_extensao)
  nome_sem_extensao <- gsub("[^[:alnum:]_]", "", nome_sem_extensao)

  # Renomear o arquivo
  novo_nome <- paste0(diretorio, "/", nome_sem_extensao, ".svg")
  file.rename(arquivo, novo_nome)
}



teste <- valid_diatom_names()

library(futebolplotR)

devtools::install_github("brunomioto/futebolplotR")
library(ButterflyColors)

futebolplotR::teams_colors_badges
View(futebolplotR::futebol_team_abbr_mapping)


diatom_species$code


diatom_code_abbr_mapping <-
   tibble::tibble(
     alt = diatom_species$code,
     code = diatom_species$code
   ) |>
   dplyr::arrange(code) |>
   tibble::deframe()

usethis::use_data(diatom_code_abbr_mapping, overwrite = TRUE)


diatom_sp_abbr_mapping <-
   tibble::tibble(
     alt = diatom_species$species,
     species = diatom_species$species
   ) |>
   dplyr::arrange(species) |>
   tibble::deframe()

usethis::use_data(diatom_sp_abbr_mapping, overwrite = TRUE)


futebolplotR::valid_team_names()


valid_diatom_code <- function(){
  map <- diatom_code_abbr_mapping
  n <- sort(unique(map))
  n
  #teams <- list.files("inst")
  #teams <- teams[!teams == "team.svg"]
  #badge_teams <- gsub('.svg', '', teams)
  #valid_names <- n[n %in% badge_teams]
  # return(valid_names)
}

diatom <- valid_diatom_code()

df <- data.frame(
  a = c(rep(1:10, 9),c(1,2,3,4)),
  b = sort(c(rep(1:9, 10), c(0,0,0,0)), decreasing = TRUE),
  diatoms = diatom[1:94]
  )

df
 90/10
length(diatom)

diatom_code_abbr_mapping


ggplot(df, aes(x = a, y = b)) +
  geom_diatom_shape(aes(diatom_code = diatoms), width = 0.1) +
  theme_void()+
  theme(
    plot.margin = margin(15,15,15,15,"pt")
  )+
  coord_cartesian(clip = "off")

valid_team_names()

futebol_team_abbr_mapping

clean_team_abbrs(abbr = futebol_team_abbr_mapping)

shape_from_code(diatom)
diatom_code <- clean_diatom_code(as.character(diatom$code), keep_non_matches = FALSE)


diatom_code_abbr_mapping
