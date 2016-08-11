#' Nearest Value Index
#'
#' Function to find the index of the nearest value from within a set of values
#'
#' @param value The value to be matched
#' @param values The set of values with which the value is being compared
#'
#' @return Index of the nearest value
#'
#' @examples
#' a <- runif()
#' nearestN(50, a)
#'
#' @export

nearestN = function(value, values) {
  
  outN = which.min( abs(values-value) )

  return(outN)
}