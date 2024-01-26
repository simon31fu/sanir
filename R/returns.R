#' Checking columns for non-character variables in each row
#'
#' This function takes a stock ticker and finds daily returns from a specified date
#'
#' @param ticker A Yahoo Finance stock ticker
#' @param date Date where returns begin
#' @return A plotly graph of returns
#'
#' @import tidyquant
#' @import dplyr
#' @import tidyr
#' @import plotly
#'
#' @examples
#' returns <- aapl
#'
#' @export
returns <- function(ticker, date) {
  tidyquant::tq_get(ticker, get = "stock.prices", from = date) %>%
    dplyr::select(date, adjusted) %>%
    dplyr::mutate(return = (adjusted - dplyr::lag(adjusted)) / dplyr::lag(adjusted)) %>%
    tidyr::drop_na() %>%
    plot_ly(x =~ date,
            y =~ return,
            type =~ "scatter")
}
