## Creates alignment points

alignment_vals <-
  data.frame(alignment = c("lawful good",
                           "neutral good",
                           "chaotic good",
                           "lawful neutral",
                           "true neutral",
                           "chaotic neutral",
                           "lawful evil",
                           "neutral evil",
                           "chaotic evil"),
              stringsAsFactors = FALSE)

usethis::use_data(alignment_vals, overwrite = TRUE)
