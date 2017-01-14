#' Create a Reproducible Project Folder
#'
#' Function to create a set of working folders for a reproducible project
#' 
#' @return Nothing is returned. The folders and text files are created.
#' 
#' @examples initProjectFolder()
#' 
#' @references The folder structure comes from Karl Broman's webinar for the American Statistical
#' Association (ASA): https://www.amstat.org/asa/files/pdfs/EDU-ReproducibleResearchWebinarTranscript.pdf
#' 
#' @author Granville J Matheson, \email{mathesong@@gmail.com}
#' 
#' @export 

initProjectFolder <- function() {
  
  # Data
  dir.create('RawData', showWarnings = F)
  dir.create('DerivedData', showWarnings = F)
  
  # Code
  dir.create('R', showWarnings = F)
  dir.create('Python', showWarnings = F)
  dir.create('MATLAB', showWarnings = F)
  
  # Other
  dir.create('Notes', showWarnings = F)
  dir.create('Refs', showWarnings = F)
  
  # Misc text files
  system('touch Readme.txt')
  system('touch ToDo.txt')
  
}