#' Example Cats
#'
#' Creates cat data with alignments for use in examples
#'
#' @return a data.frame containing example data for cats
#'
#' @examples
#' example_cats()
#'
#' @export
example_cats <- function() {

  cats <- system.file(c("img/obie.png",
                        "img/jerry.png",
                        "img/gray.png",
                        "img/jeff.png"),
                      package = "ggalignment")

  align_cats <-
    data.frame(img = cats,
               alignment = c("chaotic evil",
                             "chaotic good",
                             "chaotic neutral",
                             "lawful neutral"),
               stringsAsFactors = FALSE)

  return(align_cats)
}
