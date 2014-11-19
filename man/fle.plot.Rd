\name{fle.plot}
\alias{fle.plot}
\title{
Miscellaneous plotting functions for \code{lca} and \code{lca.rh} type regression objects.
Plot of forecasted life expectancy based on a fitted Lee-Carter model object
}
\description{
Compute the historical and forecasted life expectancy from a fitted LC object and plot them in a single (overlay) figure.
}
\usage{
fle.plot(lca.obj, at = 65, ...)
}
\arguments{
  \item{lca.obj}{an object of class \code{lca}}
  \item{at}{target age at which to calculate life expectancy}
  \item{\dots}{additional arguments to \code{forecast} function}
}
\details{
It makes use of the \code{life.expectancy} and \code{forecast} functions from the \code{demography} and \code{forecast} packages, respectively, in order to compute life expectancy at the specified target age.
}
\value{
Plot
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link[ilc]{residual_plots}}, \code{\link[ilc]{fitted_plots}}, 
\code{\link[ilc]{flc.plot}}, 	   \code{\link[forecast]{forecast}}, 
\code{\link[demography]{life.expectancy}}
}
\examples{
mod6 <- lca.rh(dd.cmi.pens, mod='lc', interpolate=TRUE)
fle.plot(mod6, at=60, h=30, level=90)
}
\keyword{method}
