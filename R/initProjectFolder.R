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

initProjectFolder <- function() {
  
  # Data
  file.create('RawData', showWarnings = F)
  file.create('DerivedData', showWarnings = F)
  
  # Code
  file.create('R', showWarnings = F)
  file.create('Python', showWarnings = F)
  file.create('MATLAB', showWarnings = F)
  
  # Other
  file.create('Notes', showWarnings = F)
  file.create('Refs', showWarnings = F)
  
  # Misc text files
  system('touch Readme.txt')
  system('touch ToDo.txt')
  
}