#' Scatter Heat Map
#'
#' Function to plot a scatter plot where each point is coloured by its 2-dimensional density.
#'
#' @param xvalues X values
#' @param yvalues Y values
#' @param xlabel X axis label
#' @param ylabel Y axis label
#' @param xlim Vector including limits of the x axis
#' @param ylim Vector including limits of the x axis
#' @param alphaval The transparency of the points
#' @param colourPal The colour palette name from viridis to use - default is Inferno
#' @param suckInVals Points beyond the limits will be sucked in to the edge values to depict that there exists more beyond the edge of the plot. Default is TRUE.
#'
#' @return Returns the ggplot2 plot
#'
#' @examples
#' 
#' x = rnorm(n = 50000, mean = 2, sd = 1)
#' y = rexp(50000, 1)
#' 
#' scatter_heatmap(x, y, 'X Values', 'Y Values', c(0, 3.5), c(-0.1, 8), 1 , 'viridis')
#' 
#' @import ggplot2
#'
#' @export

scatter_heatmap <- function(xvalues, yvalues, xlabel = 'x', ylabel = 'y', xlim = NULL, ylim = NULL, alphaval = 1, colourPal = 'inferno', suckInVals = T) {
  
  datadf <- data.frame(xvals = xvalues, yvals = yvalues)
  
  if(is.null(xlim)) xlim=c(min(xvalues),max(xvalues))
  if(is.null(ylim)) ylim=c(min(yvalues),max(yvalues)) 
  
  if(suckInVals) {
    datadf = limit_df(datadf, c(xlim[1], xlim[2]), 1 )
    datadf = limit_df(datadf, c(ylim[1], ylim[2]), 2 )
  } else {
    datadf = subset(datadf, datadf$xvals > xlim[1] & datadf$xvals < xlim[2])
    datadf = subset(datadf, datadf$yvals > ylim[1] & datadf$yvals < ylim[2])
  }
  
  datadf$dens <- densCols(datadf$xvals, datadf$yvals, colramp = colorRampPalette(viridis::viridis(n = 1000, option = colourPal)))
  
  plot <- ggplot(datadf) + 
    geom_point(aes(y = yvals, x = xvals, col = dens), alpha=alphaval) + 
    ylim(ylim[1],ylim[2]) + 
    xlim(xlim[1],xlim[2]) + 
    scale_color_identity() + 
    xlab(xlabel) + ylab(ylabel)
  
  return(plot)
  
}