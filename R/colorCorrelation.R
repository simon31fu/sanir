#' Colors correlation matrix for GGally function
#'
#' This function is used inside ggpairs in GGally package and uses a wide dataframe
#'
#' @param data Dataframe being fed into ggpairs function, should be wide df
#' @param mapping mapping specifies columns in df being used
#' @param method method of correlation to be ran on df
#' @param use type of operation, pairwise will use rows for correlation
#' @return a ggplot object
#'
#' @import tibble
#'
#' @examples
#' testCor <- tibble::tibble(ColA = seq(from = 1, to = 10), ColB = seq(from = -10, to = -1))
#' corrMatrix <- testCor %>%
#' GGally::ggpairs(axisLabels = "none", upper = list(continuous = colorCorrelation,
#' lower = list(continuous = GGally::wrap("points", size = 0.8))))
#'
#' @export
colorCorrelation <- function(data, mapping, method = "pearson", use ="pairwise"){
  x <- GGally::eval_data_col(data, mapping$x)
  y <- GGally::eval_data_col(data, mapping$y)
  correlation <- stats::cor(x, y, method = method, use = use)
  col_palate <- grDevices::colorRampPalette(c("blue", "white", "green"), interpolate = "spline")
  fill_in <- col_palate(100)[findInterval(correlation, seq(-1, 1, length = 100))]

  GGally::ggally_cor(data = data, mapping = mapping) + ggplot2::theme_void() + ggplot2::theme(panel.background = ggplot2::element_rect(fill = fill_in))

}
