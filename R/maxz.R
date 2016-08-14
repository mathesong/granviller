#'Maximum Normalised Z Value
#'
#'
#'This function calculates the maximum normalised z values for a data set as well as the range.
#'
#'@param values Vector of Values
#'
#'@examples
#'maxz( runif(20) )
#'
#'@export

maxz <- function(values) {
  
  zvals <- scale(values)
  
  maxz <- max(abs(zvals))
  
  rangez <- max(zvals) - min(zvals)
  
  out = data.frame(maxz = maxz, rangez = rangez)
    
  return(out)
}