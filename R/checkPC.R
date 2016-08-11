checkPC = function() {

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
  
  pcname = system2(command = 'hostname', stdout = T)
  
  return(pcname)
  
}