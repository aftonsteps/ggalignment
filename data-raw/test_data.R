## Creates test data

oberon <- "C:/Users/afton/Projects/ggalignment/data-raw/img/obie.png"
jerry <- "C:/Users/afton/Projects/ggalignment/data-raw/img/jerry 2.png"
gray <- "C:/Users/afton/Projects/ggalignment/data-raw/img/gray.png"
jeff <- "C:/Users/afton/Projects/ggalignment/data-raw/img/jeff 2.png"

alignment_test <-
  data.frame(img = c(oberon, jeff, jerry, gray),
             alignment = c("chaotic evil",
                           "lawful neutral",
                           "chaotic good",
                           "chaotic neutral"),
             stringsAsFactors = FALSE)

usethis::use_data(alignment_test, overwrite = TRUE)
