nearestV = function(value, values) {

  #' Nearest Value
  #'
  #' Function to find the nearest value from within a set of values
  #'
  #' @param value The value to be matched
  #' @param values The set of values with which the value is being compared
  #'
  #' @return The nearest value
  #'
  #' @examples
  #' a <- runif()
  #' nearestV(50, a)
  #'
  #' @export  

  outN = which.min( abs(values-value) )
  outV = values[outN]
  return(outV)
}