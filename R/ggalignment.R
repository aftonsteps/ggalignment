#' ggalignment
#'
#' Creates a D&D alignment chart
#'
#' @param alignment a data.frame containing the data to be plotted, requiring
#' columns `img` (for image path) and `alignment`, and optionally `x` and `y`
#' specifying the coordinates for each image, where each box has coordinate limits
#' from -1 to 1 in both axes.
#' @param line_type the linetype for the box borders, which follows the ggplot2
#' allowable values for linetype for geom_rect() (e.g. blank, solid,
#' dashed, dotted, dotdash, longdash, twodash)
#' @param line_color the color for the bounding boxes of the alignments, defaults
#' to black, and must be a named color such as "black"
#' @param font_family the font family to be used on the alignment labels
#' @param font_color the font color to be used on the alignment labels
#' @param background_color the background color for the entire plot, defaults to
#' white and must be a named color such as "white"
#' @param background_border the color of the solid-line bounding box on the entire
#' plot, defaults to NA and must be either NA or a named color such as "black"
#'
#' @return a ggplot object containing the alignment chart
#' @export
#'
#' @examples
#' ggalignment(alignment = align_cats())

ggalignment <- function(alignment,
                        line_type = "dashed",
                        line_color = "black",
                        font_family = NULL,
                        font_color = "black",
                        font_size = NULL,
                        background_color = "white",
                        background_border = NA) {
  ## Check for column names
  if (! "alignment" %in% colnames(alignment) |
      ! "img" %in% colnames(alignment)) {
    stop("alignment dataset requires columns 'img' and 'alignment'")
  }

  ## Require x and y coordinates if there are 2+ image in 1 alignment
  if (nrow(alignment) > 0 &&
      ! "x" %in% colnames(alignment) &&
      ! "y" %in% colnames(alignment)) {
    counts <-
      alignment %>%
      dplyr::group_by(alignment) %>%
      dplyr::summarize(count = dplyr::n())

    if (max(counts$count, na.rm = TRUE) > 1) {
      stop("Columns 'x' and 'y' required if multiple images per alignment")
    }
  }

  alignment_data <-
    alignment %>%
    dplyr::full_join(ggalignment::alignment_vals, by = "alignment") %>%
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
    alignment_data$x <- alignment_data$y <- rep(0)
  }

  g <-
    ggplot2::ggplot(data = alignment_data,
                    mapping = ggplot2::aes(x = x,
                                           y = y,
                                           image = img)) +
    ggplot2::scale_y_continuous(n.breaks = 20) +
    ggplot2::facet_wrap(~alignment, nrow = 3) +
    ggimage::geom_image(size = 0.5, na.rm = TRUE) +
    ggplot2::coord_fixed(xlim = c(-1, 1),
                         ylim = c(-1, 1)) +
    ggplot2::theme_void() +
    ggplot2::theme(panel.border =
                     ggplot2::element_rect(color = line_color,
                                           fill = NA,
                                           linetype = line_type),
                   strip.text =
                     ggplot2::element_text(margin =
                                             ggplot2::margin(0, 0, 8, 0),
                                           family = font_family,
                                           size = font_size,
                                           color = font_color),
                   plot.margin = ggplot2::unit(c(0, 5, 5, 5), unit = "pt"),
                   plot.background =
                     ggplot2::element_rect(fill = background_color,
                                           color = background_border))

  return(g)
}
