## Creates test data

oberon <- "data-raw/img/obie.png"
jerry <- "data-raw/img/jerry.png"
gray <- "data-raw/img/gray 3.png"
jeff <- "data-raw/img/jeff 2.png"

alignment_test <-
  data.frame(img = c(oberon, jeff, jerry, gray),
             alignment = c("chaotic neutral",
                           "chaotic neutral",
                           "chaotic neutral",
                           "chaotic neutral"),
             stringsAsFactors = FALSE)

usethis::use_data(alignment_test, overwrite = TRUE)
