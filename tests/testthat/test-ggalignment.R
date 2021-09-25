align_cats <- example_cats()

test_that("plotting works without x, y coords provided", {
  expect_error(ggalignment(align_cats), NA)
})

test_that("plotting works with x, y coords provided", {
  align_cats_with_coords <-
    align_cats %>%
    dplyr::mutate(x = c(0.5, -0.5, -0.5, 0.5),
                 y = c(-0.5, -0.5, 0.5, 0.5))
  expect_error(ggalignment(align_cats_with_coords), NA)
})

test_that("error occurs if multiple images per box and no coords", {
  align_cats_with_multis <-
    align_cats %>%
    dplyr::mutate(alignment = c("chaotic neutral",
                                "lawful neutral",
                                "chaotic good",
                                "chaotic neutral"))
  expect_error(ggalignment(align_cats_with_multis),
               "Columns 'x' and 'y' required if multiple images per alignment")
})

test_that("error does not occur if multiple images per box and coords", {
  align_cats_with_multis_and_coords <-
    align_cats %>%
    dplyr::mutate(alignment = c("chaotic neutral",
                                "lawful neutral",
                                "chaotic good",
                                "chaotic neutral"),
                  x = c(-0.5, 0, 0, 0.5),
                  y = c(-0.5, 0, 0, 0.5))
  expect_error(ggalignment(align_cats_with_multis_and_coords),
               NA)
})

test_that("error if alignmnet data missing 'alignment' column", {
  expect_error(ggalignment(align_cats %>% dplyr::select(-alignment)),
               "alignment dataset requires columns 'img' and 'alignment'")
})

test_that("error if alignmnet data missing 'img' column", {
  expect_error(ggalignment(align_cats %>% dplyr::select(-img)),
               "alignment dataset requires columns 'img' and 'alignment'")
})

test_that("error if max_images_per_dim is not integer", {
  expect_error(ggalignment(align_cats, max_images_per_dim = "boba"),
               "max_images_per_dim must be of type numeric")
})

test_that("error if max_image_dim is not acceptable value", {
  expect_error(ggalignment(align_cats, max_image_dim = "boba"),
               "max_image_dim must be one of 'width' or 'height'")
})

test_that("testing a basic plot", {
  basic_cat_chart <- ggalignment(align_cats)
  vdiffr::expect_doppelganger("Basic alignment chart with cats",
                              basic_cat_chart)
})

