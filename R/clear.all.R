#' Clear all data from the workspace
#'
#' Function to clear all data from the workspace, but leave functions intact.  It must be noted that it does not fully work, and one must run
#' the function without brackets and copy the function text to remove everything.
#'
#' @examples
#' clear.all
#'
#' @export 

clear.all <- function() {
  
  rm(list=setdiff(ls(all.names=TRUE), lsf.str(all.names=TRUE)))
}