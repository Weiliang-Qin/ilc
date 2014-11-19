\name{plot_dd}
\alias{plot_dd}
\title{
Miscellaneous plotting functions for \code{demogdata} type mortality data.
Versatile plotting tool with an optional legend.
}
\description{
Plot an object of class \code{demogdata}
}
\usage{
plot_dd(dd.obj, year = dd.obj$year, col = rainbow(length(year), start = 0.1), 
		lpos = "UL", lpar = list(), ppar = T, ...)
}
\arguments{
  \item{dd.obj}{a mortality type data object of class \code{demogdata} (or number of deaths type data object returned by \code{extract.deaths})}
  \item{year}{vector of years to be included in the plotting (all available years by default)}
  \item{col}{color palette to be used in the plot (by default, it uses a sequence of \emph{rainbow} colors)}
  \item{lpos}{a text identifier (one of "UR", "LR", "UL", "LL", "UC", "LC", "CL", "CR"; whereas the abbreviation is made up by U/L/C=Upper/Lower/Center, L/R/C=Left/Right/Center) or a list containing the coordinates (e.g. x and y) of the upper left corner of the legend/object.}
  \item{lpar}{list of additional arguments to be passed on to \code{legend} (other than \code{legend}, \code{title}, \code{col} or \code{text.col})}
  \item{ppar}{logical, if FALSE, ignores in the legend the plotting arguments \code{lty}, \code{lwd} and \code{pch} (i.e. in case they are given in \code{...}) and hence it creates a legend containing only text} 
  \item{\dots}{additional plotting arguments that are passed on to both \code{plot} and \code{legend} functions (see \code{par})}
}
\value{
Plot of mortality rates or number of deaths.
}
\author{
Zoltan Butt, Steven Haberman and Han Lin Shang
}
\seealso{
\code{\link[ilc]{extract.deaths}}, \code{\link[demography]{plot.demogdata}}, 
\code{\link[graphics]{legend}}, \code{\link[graphics]{par}}, \code{\link[grDevices]{rainbow}}
}
\examples{
# plot log mortality rates with repositioned legend 
plot_dd(dd.cmi.pens, xlim=c(40, 110), lpar=list(x.intersp=-0.2, y.intersp=0.9, cex=0.85))
# plot (untransformed) mortality rates with repositioned legend
plot_dd(dd.cmi.pens, age=60:95, lpar=list(x.intersp=-0.2, y.intersp=0.9, cex=0.85), transf=FALSE)
# plot a small subset of log mortality rates (calendar years: 1985 - 1995)
#      and add a line with the overall mean rates
plot_dd(dd.cmi.pens, lpos=list(x=0.85,y=0.55), year=1985:1995, 
		lpar=list(x.intersp=-0.1, y.intersp=0.95, cex=0.9))
lines(mean(dd.cmi.pens),lwd=2, lty=3, col='red')
# legend(coord('LC'), legend='mean rate', lwd=2, lty=3, col='red', text.col='red')
# plot number of (extracted) deaths:
tmp.d <- extract.deaths(dd.cmi.pens, ages=55:100, y=1995:2003)
plot_dd(tmp.d, transf=FALSE, lty=1:5, ylab='Number of Deaths', 
		main=paste(tmp.d$lab, ": male (1995-2003)", sep='')) 
}
\keyword{methods}
