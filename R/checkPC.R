#' Check Current PC
#'
#' Function to check which computer I'm currently using, for adjusting directories.
#'
#' @return The name of the current computer
#'
#' @examples
#' checkPC()
#'
#' @export 

checkPC = function() {
  
  pcname = system2(command = 'hostname', stdout = T)
  
  return(pcname)
  
}