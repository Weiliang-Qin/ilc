\name{dd.rfp}
\alias{dd.rfp}
\title{
Artificial (stratified) mortality experience (with Poisson error) for testing the SLC regression
}
\description{
It transforms a base age-period (2-dimensional) experience of mortality rates into artificially 'stratified' (3-dimensional) mortality rates by overlaying an extra random effect (i.e. other than age and period).  Thus, it augments the log of the 2-dimensional mortality rates by an additive effect (with any number of levels) having Poisson distribution with means specified in the \code{rfp} argument of the function.  It also randomises the base central exposures by a similar additive effect having a normal distribution with mean 0 and a constant age-specific standard deviation, which is calculated arbitrarily as the square root of the age-specific standard errors of the observed exposures. The latter adjustment is applied in order to further randomize the artificially created data.  The purpose of the artificial data is to test the Stratified Lee-Carter regression method.
}
\usage{
dd.rfp(ddata, rfp)
}
\arguments{
  \item{ddata}{mortality data object of class \code{demogdata}}
  \item{rfp}{vector of the means of the artificial additive effect, whereas the length of this argument determines the number of levels of the extra factor.}
}
\details{
Consider a cross-classified mortality experience observed over age (x) and period (t) made up of \eqn{k\times n} data cells.
This function will augment the observed data with Poisson distributed random 'noise' (reduction factors) corresponding to an extra covariate (g) having \eqn{l} levels with means specified in the \code{rfp} vector.  That is, it creates an artificial data object made up by \eqn{k\times n\times l} data cells  containing the number of deaths corresponding to each subgroup of the stratified mortality experience.
}
\value{
Multidimensional mortality data object of \code{rhdata} class with the following components:
  \item{age}{vector of ages}
 	\item{year}{vector of years}
 	\item{covariates}{names of covariates}
 	\item{deaths}{3-dimensional array of death counts}
 	\item{pop}{3-dimensional array of exposure}
	\item{mu}{3-dimensional array of force of mortality}
	\item{label}{data label}
	\item{name}{data name}
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link{elca.rh}}
}
\examples{
# vector of means of the additional effect (other than age and period):
rfp <- c(0.5, 1.2, -0.7, 2.5)
# create artificial stratified mortality experience of rhdata class:
rfp.cmi <- dd.rfp(dd.cmi.pens, rfp)
# print stratified rhdata data summary:
rfp.cmi
# plot the base level experience in the stratified rhdata
# a. central exposures:
matplot(rfp.cmi$age, rfp.cmi$pop[,,1], type='l', xlab='Age', ylab='Ec', main='Base Level')
# b. deaths:
matplot(rfp.cmi$age, rfp.cmi$deaths[,,1], type='l', xlab='Age', ylab='D', main='Base Level')
# c. log mortality rates:
matplot(rfp.cmi$age, log(rfp.cmi$mu[,,1]), type='l', xlab='Age', ylab='log(mu)', main='Base Level')
}
\keyword{method}
