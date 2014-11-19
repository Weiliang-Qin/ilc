\name{matflc.plot}
\alias{matflc.plot}
\title{
Miscellaneous plotting functions for \code{lca} and \code{lca.rh} type regression objects.
Plot of forecasted Lee-Carter models based on a series of fitted model objects
}
\description{
Comparison plots of the forecasted period effect and life expectancy of a series of fitted Lee-Carter models
}
\usage{
matflc.plot(lca.obj, lca.base, at = 65, label = NULL, ...)
}
\arguments{
  \item{lca.obj}{a list of fitted model objects of class \code{lca} (such as returned by \code{elca.rh} function)}
  \item{lca.base}{base fitted model object of class \code{lca} to be used in comparison}
  \item{at}{target age at which to calculate life expectancy}
  \item{label}{a data label}
  \item{\dots}{additional arguments to \code{forecast} function}
}
\details{
The function makes use of a univariate ARIMA process (i.e. random walk with drift) in order to extrapolate the period effects \eqn{k_t} of the model objects in \code{lca.obj}, which is illustrated by the calendar years together with the corresponding forecasted life expectancy for a given age.
}
\value{
Plot
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link{matfle.plot}}, \code{\link{flc.plot}}, \code{\link{elca.rh}}
}
\examples{
rfp.cmi <- dd.rfp(dd.cmi.pens, c(0.5, 1.2, -0.7, 2.5))
mod6e <- elca.rh(rfp.cmi, age=50:70, interpolate=TRUE, dec=3)
# plot with original (fitted) base values
matflc.plot(mod6e$lca, label='RFP CMI')
# use a standard LC model fitting as base values
mod6 <- lca.rh(dd.cmi.pens, mod='lc', error='gauss', max.age = 70, interpolate=TRUE)
matflc.plot(mod6e$lca, mod6, label='RFP CMI')
}
\keyword{plots}
