#'Test Retest Average Absolute Percentage Difference
#'
#'This function the average absolute percentage difference, as well as the individual means,
#'individual differences and average percentage differences
#'
#'@param values1 Values from the first measurements
#'@param values2 Values from the second measurements
#'
#'@examples
#'trt( runif(20), runif(20) )
#'
#'@export

aapd <- function(values1, values2) {
  
  trtmat = cbind(values1, values2)
  
  means = rowMeans(trtmat)
  diffvals = trtmat[,2] - trtmat[,1]
  percdiffs = (diffvals/means)*100
  avgpercdiff = mean(percdiffs)
  AAPD = mean(abs(percdiffs))
  
  out <- list(means = means, 
              diffvals = diffvals, 
              percdiffs=percdiffs,
              avgpercdiff = avgpercdiff, 
              AAPD = AAPD)
  
  return(out)
}