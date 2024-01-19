## code to prepare `DATASET` dataset goes here

smpsn <- tibble::tibble(companies = c("Amazon", "Meta", "Exx0n"),
                         value = c(87, 45, "13")
                        )

usethis::use_data(smpsn, overwrite = TRUE)
