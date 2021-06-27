## Creates align cats data that ships with package

oberon <- "data/img/obie.png"
jerry <- "data/img/jerry.png"
gray <- "data/img/gray 3.png"
jeff <- "data/img/jeff 2.png"

align_cats <-
  data.frame(img = c(oberon, jeff, jerry, gray),
             alignment = c("chaotic evil",
                           "lawful neutral",
                           "chaotic good",
                           "chaotic neutral"),
             stringsAsFactors = FALSE)

usethis::use_data(align_cats, overwrite = TRUE)
