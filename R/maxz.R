#'  Test Retest Maximum Normalised Z Value
#'  
#'  This function calculates the maximum normalised z values from a test-retest data set. This is calculated
#'  
#'  @param values Vector of Values
#'  
#'  @examples
#'  maxz( runif(20) )
#'  @export

maxz <- function(values) {
  
  zvals <- scale(values)
  
  maxz <- max(abs(zvals))
  
  rangez <- max(zvals) - min(zvals)
  
  out = data.frame(maxz = maxz, rangez = rangez)
    
  return(out)
}