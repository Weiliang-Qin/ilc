\name{flc.plot}
\alias{flc.plot}
\title{
Miscellaneous plotting functions for \code{lca} and \code{lca.rh} type regression objects.
Plot of forecasted Lee-Carter model based on a fitted model object
}
\description{
Plots the forecasted period effect and life expectancy of the fitted Lee-Carter model in a single graphical window.
}
\usage{
flc.plot(lca.obj, at = 65, ...)
}
\arguments{
  \item{lca.obj}{an object of class \code{lca}}
  \item{at}{target age at which to calculate life expectancy}
  \item{\dots}{additional arguments to \code{forecast} function}
}
\details{
It makes use of a univariate ARIMA process (i.e. random walk with drift) in order to extrapolate the period effect \eqn{k_t}, which is illustrated by the fitted calendar years together with the corresponding forecasted life expectancy at the specified target age.
}
\value{
Plot
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link[ilc]{residual_plots}}, \code{\link[ilc]{fitted_plots}}, 
\code{\link[ilc]{fle.plot}}, 	   \code{\link[forecast]{forecast}}, 
\code{\link[demography]{life.expectancy}}
}
\examples{
mod6 <- lca.rh(dd.cmi.pens, mod='lc', interpolate=TRUE)
flc.plot(mod6, at=60, h=30, level=90)
}
\keyword{method}
