\name{plot_per_pars}
\alias{plot_per_pars}
\title{
Miscellaneous plotting functions for \code{lca} and \code{lca.rh} type regression objects.
Plot of the period effects of the (generalised) Lee-Carter model
}
\description{
This function plots the age- and time-specific patterns of the period effects (only) obtained from the fitting of a generalised Lee-Carter model.
}
\usage{
plot_per_pars(lca.obj)
}
\arguments{
  \item{lca.obj}{an object of class \code{lca}}
}
\value{
A plot with two graphical regions showing the age- and time-specific period parameters (i.e. \eqn{beta_x^{(1)}} and \eqn{kappa_t}).
}
\references{
Renshaw, A. E. and Haberman, S. (2006), ``A cohort-based extension to the Lee-Carter model for mortality reduction factors", \emph{Insurance: Mathematics and Economics}, \bold{38}, 556-570. 

R. D. Lee and L. Carter (1992) ``Modeling and forecasting U.S. mortality", Journal of the American Statistical Association, 87(419), 659-671.
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link[ilc]{plot_coh_pars}}, \code{\link[ilc]{lca.rh}}
}
\examples{
mod6 <- lca.rh(dd.cmi.pens, mod='lc', interpolate=TRUE)
plot_per_pars(mod6)
}
\keyword{plots}
