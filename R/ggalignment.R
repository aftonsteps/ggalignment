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
#'
#' @return
#' @export
#'
#' @examples

ggalignment <- function(alignment,
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

  # d <-
  #   tibble::tibble(quadrant_name = c("lawful_good",
  #                                    "lawful_neutral",
  #                                    "lawful_evil",
  #                                    "neutral_good",
  #                                    "true_neutral",
  #                                    "neutral_evil",
  #                                    "chaotic_good",
  #                                    "chaotic_neutral",
  #                                    "chaotic_evil")) %>%
  #   dplyr::mutate(quadrant_name = forcats::fct_inorder(quadrant_name)) %>%
  #   ggplot2::ggplot() +
  #   ggplot2::facet_wrap(~quadrant_name, nrow = 3, dir = "v") +
  #   ggplot2::theme_light()

  g <-
    ggplot2::ggplot(data = alignment_data) +
    # ggplot2::ggplot(data = alignment, mapping = ggplot2::aes(x = xmin,
    #                                                          y = ymin)) +
    # ggplot2::geom_line() +
    ggplot2::coord_cartesian(xlim = c(-100, 100),
                             ylim = c(-100, 100)) +
    ggplot2::scale_y_continuous(n.breaks = 20) +
    ggplot2::facet_wrap(~alignment, nrow = 3) +
    ggimage::geom_image(mapping = ggplot2::aes(x = 0,
                                               y = 0,
                                               image = img),
                        size = 0.5,
                        asp = 1)

  # img <- png::readPNG(alignment$img[1])
  # g <-
  #   g +
  #   ggplot2::annotation_custom(grob = grid::rasterGrob(img),
  #                              xmin = -30,
  #                              xmax = 30,
  #                              ymin = -30,
  #                              ymax = 30)

  # for (idx in 1:nrow(alignment)) {
  #   img <- png::readPNG(alignment$img[idx])
  #   g <-
  #     g +
  #     ggplot2::annotation_custom(grob = grid::rasterGrob(img),
  #                                xmin = alignment$xmin[idx],
  #                                xmax = alignment$xmax[idx],
  #                                ymin = alignment$ymin[idx],
  #                                ymax = alignment$ymax[idx])
  # }

  g <-
    g +
    ggplot2::theme_void() +
    ggplot2::theme(axis.text = ggplot2::element_text(color = "black"),
                   axis.ticks = ggplot2::element_line(color = "black"))

  return(g)
  #return(ggimage::ggbackground(gg = g, background = background))
}
