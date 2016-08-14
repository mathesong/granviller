#'Test Retest Summary Statistics
#'
#'This function calculates several common summary statistic parameters useful for test-retest studies.
#'
#'@param values Vector of values
#'
#'@examples
#'sumstats( runif(20) )
#'
#'@export

sumstats <- function(values) {
  
  meanval = mean(values)
  sdval = sd(values)
  seval = sdval / (length(values))^0.5
  covval = sdval / meanval
  
  out = data.frame(mean = meanval, sd = sdval, se = seval, cov = covval)
  return(out)
  
}