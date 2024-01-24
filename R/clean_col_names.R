#' Cleans column names in a dataframe
#'
#' This function takes a vector of characters and cleans them for abnormalities
#'
#' @param column_names A vector of column names
#' @param keep_special A boolean variable to keep/discard special characters
#' @return A sanitized vector
#'
#' @examples
#' clean_col_names(column_names = colnames(sanir::smpsn), keep_special = FALSE)
#'
#' @export
clean_col_names <- function(column_names, keep_special) {
  cleaned_column <- gsub(" ", "", column_names) #%>%
   # dplyr::if_else(keep_special == TRUE, gsub("[[:punct:]]", ""))
  return(cleaned_column)
}
# commenting out to make sure other function runs
# gsub(" ", "", c("hp", "h^")) %>%
#   +     gsub("[[:punct:]]", "", .)
# what I last put into the console, returned "hp" and "h"

