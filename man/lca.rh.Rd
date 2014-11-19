\name{lca.rh}
\alias{lca.rh}
\title{
A class of generalised Lee-Carter models
}
\description{
A purpose-built regression routine to fit any of the six variants of the class of Lee-Carter model structures using an iterative Newton-Raphson fitting method.
}
\usage{
lca.rh(dat, year = dat$year, age = dat$age, series = 1, max.age = 100, 
	   dec.conv = 6, clip = 3, error = c("poisson", "gaussian"), 
	   model = c("m", "h0", "h1", "h2", "ac", "lc"), 
 	   restype = c("logrates", "rates", "deaths", "deviance"), scale = F, 
 	   interpolate = F, verbose = T, spar = NULL)
}
\arguments{
  \item{dat}{source data object of \code{demogdata} class}
  \item{year}{vector of years to be included in the regression (all available years by default)}
  \item{age}{vector of ages to be included in the regression (all available ages by default)}
  \item{series}{numerical index corresponding to the target series to be used from the source data}
  \item{max.age}{highest age to be used in the regression}
  \item{dec.conv}{number of decimal places used to achieve convergence. The lower the value the faster the convergence of the fitting algorithm.}  
  \item{clip}{number of marginal birth cohorts to exclude from the regression (i.e., give 0 weights).  It is only applicable to the first 5 models (see below)}
  \item{error}{type of error structure of the model choice (Poisson distribution of the errors by default)}
  \item{model}{a character (see usage) or a numeric value (1-6) to specify the model choice}
  \item{restype}{types of residuals, which also controls the type of the fitted value.
  Thus, in the cases of \code{logrates} and \code{rates} the function returns as fitted values the log and untransformed mortality rates, respectively. Likewise, the choices of \code{deaths} and \code{deviance} correspond to the fitted number of deaths}
  \item{scale}{logical, if TRUE, re-scale the interaction parameters so that the \eqn{k_t} has drift parameter equal to 1	(see also \code{\link[demography]{lca}}) }
  \item{interpolate}{logical, if TRUE, replace before regression all zero or missing values in the mortality rates of \code{dat} argument by interpolation across calendar years (see also \code{\link[demography]{smooth.demogdata}})}  
  \item{verbose}{logical, if TRUE, the program prints out the updated deviance values along with the starting and final parameter estimates}  
  \item{spar}{numerical smoothing spline parameter in the interval (0,1] (with a recommended value of 0.6).  If it is not NULL, the interaction effects (i.e. \eqn{\beta_x^{(0,1)}}) are smoothed out after the initial regression. Consequently, the period and/or cohort effects are adjusted (smoothed out) accordingly.}
}
\details{
Implements the modelling approach proposed in Renshaw and Haberman (2006), which extends the basic Lee-Carter model within the GLM framework. The function makes use of tailored iterative Newton-Raphson fitting algorithms to estimate the graduation parameters of the six variants within this class of extended Lee-Carter models.
}
\value{
A Lee-Carter type fitted object with the following components:
\item{label}{data label}
\item{age}{vector of fitted ages}
\item{year}{vector of fitted fitted years}
\item{<series>}{matrix of observed (source) mortality rates used for fitting. It is named the same way as the chosen series}
\item{ax}{parameter estimates of (mean) age-specific mortality rates across the entire fitting period}
\item{bx}{parameter estimates of age-specific interaction effect between age and period}
\item{kt}{parameter estimates of year-specific period trend of mortality rates}
\item{df}{degree of freedom of the fitted GLM model}
\item{residuals}{residuals of the fitted model in the form of a functional time series object}
\item{fitted}{fitted values of the fitted model in the form of a functional time series object}
\item{varprop}{percent of variance}
\item{y}{source mortality data in the form of a functional time series object}
\item{mdev}{mean deviance of total and base lack of fit (see also \code{\link[demography]{lca}})}
\item{model}{string expression of the fitted model}
\item{adjust}{type of error structure (e.g. "poisson" or "gaussian")}
\item{call}{copy of the R call to the model}
\item{conv.iter}{number of iterations used to reach convergence}
\item{bx0}{parameter estimates of age-specific interaction effect between age and cohort (only applies to the age-period-cohort model)}
\item{itx}{parameter estimates of year-specific cohort trend of mortality rates (only applies to the age-period-cohort model)}
}
\references{
Renshaw, A. E. and Haberman, S. (2003a), ``Lee-Carter mortality forecasting: a parallel generalised linear modelling approach for England and Wales mortality projections", \emph{Journal of the Royal Statistical Society, Series C}, \bold{52}(1), 119-137.

Renshaw, A. E. and Haberman, S. (2003b), ``Lee-Carter mortality forecasting with age specific enhancement", \emph{Insurance: Mathematics and Economics}, \bold{33}, 255-272.

Renshaw, A. E. and Haberman, S. (2006), ``A cohort-based extension to the Lee-Carter model for mortality reduction factors", \emph{Insurance: Mathematics and Economics}, \bold{38}, 556-570. 

Renshaw, A. E. and Haberman, S. (2008), ``On simulation-based approaches to risk measurement in mortality with specific reference to Poisson Lee-Carter modelling", \emph{Insurance: Mathematics and Economics}, \bold{42}(2), 797-816.

Renshaw, A. E. and Haberman, S. (2009),  ``On age-period-cohort parametric mortality rate projections", \emph{Insurance: Mathematics and Economics}, \bold{45}(2), 255-270.
}
\author{
Zoltan Butt, Steven Haberman and Han Lin Shang
}
\seealso{
\code{\link[ilc]{dd.rfp}}, \code{\link[ilc]{elca.rh}}, \code{\link[demography]{lca}}
}
\examples{
# standard LC model with Gaussian errors (corresponding to SVD graduation):
#   correct 0 or missing mortality rates before graduation
mod6g <- lca.rh(dd.cmi.pens, mod='lc', error='gauss', max=110, interpolate=TRUE)
# AP LC model with Poisson errors
mod6p <- lca.rh(dd.cmi.pens, mod='lc', error='pois', interpolate=TRUE)
# Model Summary, Coefficients and Plotting:
mod6p; coef(mod6p); plot(mod6p)

# Comparison with standard fitting method
# Standard LC model (with Gaussian errors) - SVD fit (demography package)
modlc <- lca(dd.cmi.pens, interp=TRUE, adjust='none')
# Gaussian (SVD) - Gaussian (iterative)
round(modlc$ax-mod6g$ax, 4)
round(modlc$bx-mod6g$bx, 4)
round(modlc$kt-mod6g$kt, 4)
# -------------------------------------------------- #

# APC LC model fitted to restricted age range with 'deviance' residuals 
#  the remaining 0/NA values reestimated:
# WARNING: for proper fit recommend dec=6, but it can lead to slow convergence!
mod1 <- lca.rh(dd.cmi.pens, age=60:100, mod='m', interpolate=TRUE, res='dev', dec=1)
}
\keyword{methods}
