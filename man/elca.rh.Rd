\name{elca.rh}
\alias{elca.rh}
\title{
Extended (Stratified) Lee-Carter model (with a single extra parameter)
}
\description{
A purpose-built regression routine to fit the extended Lee-Carter model with an extra additive effect of an observable factor (other than age and period) on the log mortality mortality rates.
}
\usage{
elca.rh(dat, year = dat$year, age = dat$age, dec.conv = 6, 
		error = c("poisson", "gaussian"), 
		restype = c("logrates", "rates", "deaths", "deviance"), 
		scale = F, interpolate = F, verbose = T, spar = NULL, ax.fix = NULL)
}
\arguments{
  \item{dat}{\code{rhdata} class multidimensional mortality data object}
  \item{year}{vector of years to be included in the regression (all available years by default)}
  \item{age}{vector of ages to be included in the regression (all available ages by default)}
  \item{dec.conv}{number of decimal places used to achieve convergence. The lower the value the faster the convergence of the fitting algorithm. Note: very high values could over fit the parameters.}
  \item{error}{type of error structure of the model choice (Poisson distribution of the errors by default)}
  \item{restype}{types of residuals, which also controls the type of the fitted value.
  Thus, in the cases of \code{logrates} and \code{rates} the function returns as fitted values the log and untransformed mortality rates, respectively. Likewise, the choices of \code{deaths} and \code{deviance} correspond to the fitted number of deaths}
  \item{scale}{logical, if TRUE, re-scale the interaction parameters so that the \eqn{k_t} has drift parameter equal to 1	(see also \code{\link[demography]{lca}}) }
  \item{interpolate}{logical, if TRUE, replace before regression all zero or missing values in the mortality rates of \code{dat} argument by interpolation across calendar years (see also \code{\link[demography]{smooth.demogdata}})}
  \item{verbose}{logical, it controls the amount of process information}
  \item{spar}{numerical smoothing spline parameter in the interval (0,1] (with a recommended value of 0.6).  If it is not NULL, the interaction effects (i.e. \eqn{\beta_x^{(0,1)}}) are smoothed out after the initial regression. Consequently, the period and/or cohort effects are adjusted (smoothed out) accordingly.}
  \item{ax.fix}{vector of constant age effect to be used in the model (e.g. the fitted values of a standard LC regression to the experience of a large population). If NULL the base ax values are estimated from \code{dat}}
}
\details{
This function models the number of deaths for a group within a generalised Lee-Carter framework with a Poisson or Gaussian error structure. The methodology quantifies the differences in the mortality experience of population subgroups differentiated by an additional measurable covariate (other than age and period). Additional covariate, for instance, could be related to geographical, socio-economic or race differences.
}
\value{
An object of class \code{elca} with the following components:
\item{lca}{list of fitted \code{lca} model objects by the level of the extra factor}
\item{age}{vector of fitted ages}
\item{year}{vector of fitted years}
\item{ag}{parameter estimates of the effects of the extra factor}
\item{ax}{parameter estimates (or ax.fix) of (mean) age-specific mortality rates across the entire fitting period}
\item{bx}{parameter estimates of age-specific interaction effect between age and period}
\item{kt}{parameter estimates of year-specific period trend of mortality rates}
\item{adjust}{type of error structure used in fitting (e.g. "poisson" or "gaussian")}
\item{label}{data label}
\item{call}{copy of the R call to the model}
\item{conv.iter}{number of iterations used to reach convergence}
\item{mdev}{mean deviance of total and base lack of fit (see also \code{\link[demography]{lca}})}
\item{model}{string expression of the fitted model}
\item{df}{degree of freedom of the fitted GLM model}
}
\references{
Li, N. and Lee, R. D. (2005), `Cohort mortality forecasts for a group of populations: an extension of the Lee-Carter method', Demography, 42(3), 575-594.
Renshaw and Haberman (2006), `A cohort-based extension to the Lee-Carter model for mortality reduction factors.', Insurance: Mathematics and Economics, 38, 556-570.
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link{dd.rfp}}, \code{link{rhdata}}
}
\examples{
rfp <- c(0.5, 1.2, -0.7, 2.5)
rfp.cmi <- dd.rfp(dd.cmi.pens, rfp)
mod6e <- elca.rh(rfp.cmi, age=50:100, interp=TRUE, dec=3, verb=TRUE)
# display model summary and diagnostics:
mod6e; coef(mod6e)
}
\keyword{method}
