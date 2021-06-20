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
              stringsAsFactors = FALSE) #%>% ## NOTE! put the good and evil back if uncommented
  # dplyr::mutate(xmin = rep(c(-90, -15, 60), 3),
  #               ymin = rep(c(-85, -15, 58), each = 3)) %>%
  # dplyr::mutate(xmax = xmin + 30, ymax = ymin + 30)

usethis::use_data(alignment_vals, overwrite = TRUE)
