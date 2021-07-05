#' Align Cats
#'
#' Creates align cats data for use in example code
#'
#' @return align_cats, a data.frame containing example data
#' @export
#'
#' @examples
#' align_cats()
align_cats <- function() {
  oberon <- paste0(system.file("ggalignment"), "inst/img/obie.png")
  jerry <- paste0(system.file("ggalignment"), "inst/img/jerry.png")
  gray <- paste0(system.file("ggalignment"), "inst/img/gray_3.png")
  jeff <- paste0(system.file("ggalignment"), "inst/img/jeff_2.png")

  align_cats <-
    data.frame(img = c(oberon, jeff, jerry, gray),
               alignment = c("chaotic evil",
                             "lawful neutral",
                             "chaotic good",
                             "chaotic neutral"),
               stringsAsFactors = FALSE)

  return(align_cats)
}
