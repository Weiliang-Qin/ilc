\name{plot_coh_pars}
\alias{plot_coh_pars}
\title{
Miscellaneous plotting functions for \code{lca.rh} type regression objects.
Plot of the cohort effects of the generalised Lee-Carter model
}
\description{
This function plots the age- and time-specific patterns of the cohort effects (only) obtained from the fitting of a generalised Lee-Carter model.
}
\usage{
plot_coh_pars(lca.obj)
}
\arguments{
  \item{lca.obj}{an object of class \code{lca.rh} (containing a generalised LC model with a cohort effect)}
}
\value{
A plot with two graphical regions showing the age- and time-specific cohort parameters (i.e. \eqn{beta_x^{(0)}} and \eqn{iota_t}).
}
\references{
Renshaw, A. E. and Haberman, S. (2006), ``A cohort-based extension to the Lee-Carter model for mortality reduction factors", \emph{Insurance: Mathematics and Economics}, \bold{38}, 556-570. 

R. D. Lee and L. Carter (1992) ``Modeling and forecasting U.S. mortality", Journal of the American Statistical Association, 87(419), 659-671.
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link[ilc]{plot.per.pars}}, \code{\link[ilc]{lca.rh}}
}
\examples{
mod1 <- lca.rh(dd.cmi.pens, age=60:100, mod='m', interpolate=TRUE, res='dev', dec=1)
plot_coh_pars(mod1)
}
\keyword{plots}
