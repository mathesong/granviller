limit_df <- function(df, limits, columns) {

  #' Limit a Data Frame
  #'
  #' Function to limit the values of a column or columns of a data frame
  #'
  #' @param df The data frame whose values are to be limited
  #' @param limits The limits to be imposed on the column/columns of the data frame
  #'
  #' @return The data frame after being limited
  #'
  #' @examples
  #' a <- data.frame(Year = 1900:1980, Potatos = round(runif(81)*100))
  #' limit_df(a, c(0, 50), 2)
  #'
  #' @export
  
  df[,columns][df[,columns] > max(limits)] = max(limits)
  df[,columns][df[,columns] < min(limits)] = min(limits)
  
  return(df)
  
}