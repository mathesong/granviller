#' Chunk It Up
#'
#' Create a chunk column for parallelising tasks
#'
#' @param .data The data frame or tibble
#' @param chunksize The number of rows per chunk. Specify either chunksize or nchunks.
#' @param nchunks The number of chunks. Specify either nchunks or chunksize.
#'
#' @return A chunk number vector
#' @export
#'
#' @examples
#' data(mtcars)
#'
#' mtcars$chunk <- chunk_it_up(mtcars, nchunks=3)
#' mtcars$chunk <- chunk_it_up(mtcars, chunksize=5)
chunk_it_up <- function(.data, chunksize=NULL, nchunks=NULL) {

  if(is.null(chunksize) & is.null(nchunks)) {
    stop("Please specify either chunksize or nchunks")
  }

  if(!is.null(chunksize) & !is.null(nchunks)) {
    stop("Please specify either chunksize or nchunks")
  }

  if(!is.null(chunksize)) {
    nchunks <- ceiling(nrow(.data) / chunksize)
  } else {
    chunksize <- ceiling(nrow(.data) / nchunks)
  }

  chunkvec <- rep(1:nchunks, each=chunksize)
  chunkvec <- chunkvec[1:nrow(.data)]

  return(chunkvec)
}
