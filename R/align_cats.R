#' Align Cats
#'
#' Creates align cats data for use in example code
#'
#' @return align_cats, a data.frame containing example data
#'
#' @examples
#' align_cats
#' @export align_cats
align_cats <- function() {

  cats <- system.file(c("img/obie.png",
                        "img/jerry.png",
                        "img/gray.png",
                        "img/jeff.png"),
                      package = "ggalignment")

  align_cats <-
    data.frame(img = cats,
               alignment = c("chaotic evil",
                             "lawful neutral",
                             "chaotic good",
                             "chaotic neutral"),
               stringsAsFactors = FALSE)

  return(align_cats)
}
