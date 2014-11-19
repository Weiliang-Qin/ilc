\name{matfle.plot}
\alias{matfle.plot}
\title{
Miscellaneous plotting functions for \code{lca} and \code{lca.rh} type regression objects.
Plot of forecasted life expectancy based on a series of fitted Lee-Carter model objects
}
\description{
Compute the historical and forecasted life expectancy of a series of fitted Lee-Carter models and plot them in one comparative figure 
}
\usage{
matfle.plot(lca.obj, lca.base, at = 65, label = NULL, ...)
}
\arguments{
  \item{lca.obj}{a list of fitted model objects of class \code{lca} (such as returned by \code{elca.rh} function)}
  \item{lca.base}{base fitted model object of class \code{lca} to be used in comparison}
  \item{at}{target age at which to calculate life expectancy}
  \item{label}{a data label}
  \item{\dots}{additional arguments to \code{forecast} function}
}
\details{
It makes use of the \code{life.expectancy} and \code{forecast} functions from the \code{demography} and \code{forecast} packages, respectively, in order to compute life expectancy at the specified target age for each of the model objects in \code{lca.obj}.}
\value{
Plot
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link{matflc.plot}}, \code{\link{fle.plot}}, \code{\link{elca.rh}}
}
\examples{
rfp.cmi <- dd.rfp(dd.cmi.pens, c(0.5, 1.2, -0.7, 2.5))
mod6e <- elca.rh(rfp.cmi, age=50:100, interpolate=TRUE, dec=3)
# plot with original (fitted) base values
matfle.plot(mod6e$lca, label='RFP CMI')
# use a standard LC model fitting as base values
mod6 <- lca.rh(dd.cmi.pens, mod='lc', error='gauss', interpolate=TRUE)
matfle.plot(mod6e$lca, mod6, label='RFP CMI')
}
\keyword{plots}
