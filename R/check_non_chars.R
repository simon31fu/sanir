#' Checking columns for non-character variables in each row
#'
#' This function takes a long dataframe as input and returns the position of these variables
#'
#' @param column A vector
#' @return A sanitized vector
#'
#' @examples
#' check_non_chars(smpsn$companies)
#'
#' @export
check_non_chars <- function(column) {
  non_char_rows <- grep("[^a-z, A-Z, ]", column)
  return(non_char_rows)
}
