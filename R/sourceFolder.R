#' Source all R scripts within  folder
#'
#' Function to source all the R scripts within a given folder
#'
#' @param folder The folder to be sourced
#'
#'
#' @examples
#' sourceFolder('C:/Viruses')
#'
#' @export

sourceFolder <- function(folder) {

a <- list.files(pattern="*.R",path=folder,full.names=T)
sourceTools <- sapply(X=a,FUN=source)

}