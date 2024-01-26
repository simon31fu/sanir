#' Checking columns for non-character variables in each row
#'
#' This function takes a long dataframe as input and returns the position of these variables
#'
#' @param columns A vector of column names
#' @return A sanitized vector
#'
#' @import stringr
#'
#' @examples
#' check_non_chars(smpsn$companies)
#'
#' @export
cols_set <- function(columns) {
  cols <- stringr::str_to_title(columns)
  return(cols)
}
