\name{lca.dev.res}
\alias{lca.dev.res}
\title{
Miscellaneous utility functions for \code{lca} and \code{lca.rh} type regression objects.
Deviance residuals of the Lee-Carter model
}
\description{
A simple utility function to replace the original residuals (e.g. logrates, rates, deaths) of a LC fit with deviance residuals without the need to re-estimate the regression parameters. We note that the estimation of the parameters can be particularly slow in the case of the APC model. 
}
\usage{
lca.dev.res(lca.obj, pop, clip = 0)
}
\arguments{
  \item{lca.obj}{an object of class \code{lca}}
  \item{pop}{matrix of population data corresponding to the fitted mortality rates}
  \item{clip}{number of years to clip from start and end of cohort years}
}
\details{
The Lee-Carter regression object contains the type of residuals specified in the original function call, which might need to be changed for further analysis, but without actually re-running the entire iterative estimation process.
}
\value{
An identical regression object as \code{lca.obj} containing the corresponding deviance residuals
}
\author{
Zoltan Butt, Steven Haberman and Han Lin Shang
}
\seealso{
\code{\link[ilc]{lca.rh}}
}
\examples{
# original model object with 'logrates' residuals
mod6 <- lca.rh(dd.cmi.pens, mod="lc", error="gauss", max=110, interpolate=TRUE)
# adjusted model object with 'deviance' residuals: 
dev6 <- lca.dev.res(mod6, insp.dd(dd.cmi.pens, "pop"))
}
\keyword{method}
