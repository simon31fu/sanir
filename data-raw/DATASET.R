## code to prepare `DATASET` dataset goes here

smpsn <- tibble::tibble(companies = c("Amazon", "Meta", "Exx0n"),
                         value = c(87, 45, "13")
                        )

usethis::use_data(smpsn, overwrite = TRUE)


aapl <- tidyquant::tq_get("AAPL", get = "stock.prices", from = "2019-01-01") %>%
  dplyr::select(date, adjusted) %>%
  dplyr::mutate(return = (adjusted - dplyr::lag(adjusted)) / dplyr::lag(adjusted)) %>%
  tidyr::drop_na() %>%
  plot_ly(x =~ date,
          y =~ return)
usethis::use_data(aapl, overwrite = TRUE)
