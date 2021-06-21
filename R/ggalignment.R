## 1. alignment = data.frame containing a column for image and a column for
## alignment
##
## 2. a vector for images, a vector for alignments
# oberon <- png::readPNG("data/img/obie.png")
# jerry <- png::readPNG("data/img/jerry 2.png")

## TODO check to make sure we don't need system.file
## TODO look into faceting :D

#' ggalignment
#'
#' Creates a D&D alignment chart
#'
#' @param alignment
#' @param background
#' @param alignment_coords
#' @param linetype the linetype for the box borders, which follows the ggplot2
#' allowable values for linetype for geom_rect() (e.g. blank, solid,
#' dashed, dotted, dotdash, longdash, twodash)
#' @param linecolor the color for the bounding boxes of the alignments, defaults
#' to black, and must be a named color such as "black"
#' @param background_color the background color for the entire plot, defaults to
#' white and must be a named color such as "white"
#' @param background_border the color of the solid-line bounding box on the entire
#' plot, defaults to NA and must be either NA or a named color such as "black"
#'
#' @return
#' @export
#'
#' @examples

ggalignment <- function(alignment,
                        linetype = "dashed",
                        linecolor = "black",
                        font_family = "Arial",
                        font_color = "black",
                        background_color = "white",
                        background_border = NA,
                        background = ggalignment::dotted_lines_bg,
                        alignment_coords = ggalignment::alignment_vals) {
  alignment_data <-
    alignment %>%
    dplyr::full_join(alignment_coords, by = "alignment") %>%
    dplyr::mutate(alignment = factor(alignment,
                                     levels = c("lawful good",
                                                "neutral good",
                                                "chaotic good",
                                                "lawful neutral",
                                                "true neutral",
                                                "chaotic neutral",
                                                "lawful evil",
                                                "neutral evil",
                                                "chaotic evil")))

  if (! "x" %in% colnames(alignment_data) &
      ! "y" %in% colnames(alignment_data)) {
    alignment_data$x <- alignment_data$y <- rep(0.5)
    alignment_data <-
      alignment_data %>%
      dplyr::group_by(alignment) %>%
      dplyr::mutate(count = dplyr::n()) %>%
      dplyr::group_by(count) %>%
      dplyr::mutate(per_row = sqrt((ceiling(sqrt(count)))^2)) %>%
      dplyr::mutate(row_seq = rep(1:max(per_row), max(count)/max(per_row))) %>%
      dplyr::mutate(col_seq = rep(1:max(per_row), each = max(per_row))) %>%
      dplyr::mutate(row_seq = (row_seq - mean(row_seq)),
                    col_seq = (col_seq - mean(col_seq))) %>%
      dplyr::mutate(x = x + row_seq, y = y + col_seq)
  }

  g <-
    ggplot2::ggplot(data = alignment_data,
                    mapping = ggplot2::aes(x = row_seq,
                                           y = col_seq,
                                           image = img)) +
    ggplot2::scale_y_continuous(n.breaks = 20) +
    ggplot2::facet_wrap(~alignment, nrow = 3) +
    ggimage::geom_image(size = 0.5) +
    ggplot2::coord_fixed(xlim = c(-1, 1),
                         ylim = c(-1, 1)) +
    ggplot2::theme_void() +
    ggplot2::theme(panel.border =
                     ggplot2::element_rect(color = linecolor,
                                           fill = NA,
                                           linetype = linetype),
                   strip.text =
                     ggplot2::element_text(margin =
                                             ggplot2::margin(0, 0, 8, 0),
                                           family = font_family,
                                           color = font_color),
                   plot.margin = ggplot2::unit(c(0, 5, 5, 5), unit = "pt"),
                   plot.background =
                     ggplot2::element_rect(fill = background_color,
                                           color = background_border))

  return(g)
}
