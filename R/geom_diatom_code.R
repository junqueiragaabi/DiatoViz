#' ggplot2 Layer for visualizing the silhouettes of diatoms.
#'
#' @description This geom is used to plot silhouettes of diatoms instead
#'   of points in a ggplot. It requires x, y aesthetics as well as a valid diatoms code. The latter can be checked with [`valid_diatom_code()`].
#'
#' @inheritParams ggplot2::geom_point
#' @section Aesthetics:
#' `geom_diatom_code()` understands the following aesthetics (required aesthetics are in bold):
#' \itemize{
#'   \item{**x**}{ - The x-coordinate.}
#'   \item{**y**}{ - The y-coordinate.}
#'   \item{**diatom_code**}{ - The diatoms codes. Should be one of [`valid_diatom_code()`]. The function tries to clean diatom codes internally by calling [`DiatoViz::clean_diatom_code()`].}
#'   \item{`alpha = NULL`}{ - The alpha channel, i.e. transparency level, as a numerical value between 0 and 1.}
#'   \item{`colour = NULL`}{ - The image will be colorized with this colour. Use the special character `"b/w"` to set it to black and white. For more information on valid colour names in ggplot2 see <https://ggplot2.tidyverse.org/articles/ggplot2-specs.html?q=colour#colour-and-fill>}
#'   \item{`angle = 0`}{ - The angle of the image as a numerical value between 0° and 360°.}
#'   \item{`hjust = 0.5`}{ - The horizontal adjustment relative to the given x coordinate. Must be a numerical value between 0 and 1.}
#'   \item{`vjust = 0.5`}{ - The vertical adjustment relative to the given y coordinate. Must be a numerical value between 0 and 1.}
#'   \item{`width = 1.0`}{ - The desired width of the image in `npc` (Normalised Parent Coordinates).
#'                           The default value is set to 1.0 which is *big* but it is necessary
#'                           because all used values are computed relative to the default.
#'                           A typical size is `width = 0.075` (see below examples).}
#'   \item{`height = 1.0`}{ - The desired height of the image in `npc` (Normalised Parent Coordinates).
#'                            The default value is set to 1.0 which is *big* but it is necessary
#'                            because all used values are computed relative to the default.
#'                            A typical size is `height = 0.1` (see below examples).}
#' }
#' @param ... Other arguments passed on to [ggplot2::layer()]. These are
#'   often aesthetics, used to set an aesthetic to a fixed value. See the below
#'   section "Aesthetics" for a full list of possible arguments.
#' @return A ggplot2 layer ([ggplot2::layer()]) that can be added to a plot
#'   created with [ggplot2::ggplot()].
#' @export
#'
geom_diatom_code <- function(mapping = NULL, data = NULL,
                           stat = "identity", position = "identity",
                           ...,
                           na.rm = FALSE,
                           show.legend = FALSE,
                           inherit.aes = TRUE) {

  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomDIATOM,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      na.rm = na.rm,
      ...
    )
  )
}

#' @rdname DiatoViz-package
#' @export
#
GeomDIATOM <- ggplot2::ggproto(
  "GeomDIATOM", ggplot2::Geom,
  required_aes = c("x", "y", "diatom_code"),
  # non_missing_aes = c(""),
  default_aes = ggplot2::aes(
    alpha = NULL, colour = NULL, angle = 0, hjust = 0.5,
    vjust = 0.5, width = 1.0, height = 1.0
  ),
  draw_panel = function(data, panel_params, coord, na.rm = FALSE) {

    diatom_code <- clean_diatom_code(as.character(data$diatom_code), keep_non_matches = FALSE)

    data$path <- shape_from_diatom(diatom_code)

    ggpath::GeomFromPath$draw_panel(
      data = data,
      panel_params = panel_params,
      coord = coord,
      na.rm = na.rm
    )
  },
  draw_key = function(...) grid::nullGrob()
)
