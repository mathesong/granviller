#'Test Retest Summary
#'
#'This function calculates several common parameters for evaluating test-retest reliability. The output
#'is a detailed list, containing one summarised tidy output called tidy.
#'
#'@param values1 Values from the first measurements
#'@param values2 Values from the second measurements
#'
#'@examples
#'trt( runif(20), runif(20) )
#'
#'@export


trt <- function(values1, values2) {
  
  trtmat = cbind(values1, values2)
  
  icc <- psych::ICC(trtmat)
  diffs <- aapd(values1, values2)
  zvals1 = maxz(values1)
  zvals2= maxz(values2)
  zvals = maxz(c(values1, values2))
  sumstat1 = sumstats(values1)
  sumstat2 = sumstats(values2)
  sumstat = sumstats(c(values1, values2))
  sem = sumstat$sd * sqrt(1 - icc$results$ICC[1])
  md = 100*(sem * 1.96 * sqrt(2))/sumstat$mean

  
  tidyout = data.frame(
    # Numerical
    mean = sumstat$mean,
    sd = sumstat$sd,
    cov = sumstat$cov,
    se = sumstat$se,
    
    # Distributional
    skew=sumstat$skew,
    kurtosis=sumstat$kurtosis,
    
    # Test-Retest
    icc = icc$results$ICC[1],
    aapd = diffs$AAPD,
    sem = sem,
    md = md,
    avgpercchange = diffs$avgpercdiff)
  
  out <- list(tidy = tidyout, 
              icc = icc, 
              diffs = diffs, 
              zvals1 = zvals1, 
              zvals2 = zvals2, 
              zvals = zvals, 
              sumstat = sumstat, 
              sumstat1 = sumstat1, 
              sumstat2 = sumstat2, 
              sem = sem,
              md = md)
  
  return(out)
  
}