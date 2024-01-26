#' Creates plotly linechart with multiple lines as colors
#'
#' Plotly function with multiple lines
#'
#' @param data Dataframe being fed into plotly, should be long df
#' @param xAxis name of column to be used as x axis
#' @param yAxis name of column to be used as y axis
#' @param multi name of column that has seperate names for each line
#' @param titlePlot name of plot
#' @return a plotly object
#'
#' @import tibble
#' @import plotly
#'
#' @examples
#' sample <- tibble::tibble(time = seq(from = 1, to = 10), volume = seq(from = 11, to = 20),
#' car = "Toyota") %>% rbind(tibble::tibble(time = seq(from = 1, to = 10),
#'                                         volume = seq(from = 31, to = 40),
#'                                         car = "Jeep"))
#' multiLinePlot(data = sample, xAxis = "time", yAxis = "volume", multi = "car",
#' titlePlot = "Car Details")
#' @export
multiLinePlot <- function(data, xAxis, yAxis, multi, titlePlot) {

  data %>%
    plotly::plot_ly(
      x = ~ get(xAxis),
      y = ~ get(yAxis),
      color = ~ get(multi),
      type = "scatter",
      mode = "lines"
    ) %>%
    plotly::layout(
      title = list(text = titlePlot, x = 0.5),
      xaxis = list(title = xAxis),
      yaxis = list(title = yAxis)
    )
}
