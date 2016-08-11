cd <- function() {
  
  #' Change Directory
  #'
  #' Function to change directory to the directory stored in the clipboard
  #'
  #'
  #' @examples
  #' cd()
  #'
  #' @export
  
  setwd(readClipboard())
}