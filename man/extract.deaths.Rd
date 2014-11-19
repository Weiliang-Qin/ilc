\name{extract.deaths}
\alias{extract.deaths}
\title{
Miscellaneous utility functions for \code{demogdata} type mortality data
}
\description{This function calculates and outputs the corresponding (observed) number of deaths from a \code{demogdata} type mortality data for a choice of ages and calendar years.
}
\usage{
extract.deaths(data, ages = data$age, years = data$year, combine.upper = T, 
				fill.method = NULL, series = names(data$rate)[1])
}
\arguments{
  \item{data}{mortality data object of \code{demogdata} class}
  \item{ages}{vector of ages to extract}
  \item{years}{vector of years to extract}
  \item{combine.upper}{logical, if TRUE, ages above max(ages) will be grouped together}
  \item{fill.method}{string value indicating the method to be used for correcting missing or 0 transition rates before estimating the number of deaths (e.g. one of "perks", "interpolate" or "mspline").  By default is set to NULL, which corresponds to no data correction.}
  \item{series}{target series name (e.g. 'males') or index number (e.g. 1) of the data object to be extracted}
}
\value{
A 'fictive' \code{demogdata} class object in which the (mortality) \code{rate} component is replaced by the extracted number of deaths.
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\note{
When estimating the number of deaths (as the product between mortality rates and exposures), some assumptions will need to be made for the cases where the mortality rates are missing (NA).  That is, it is not possible to estimate the number of deaths where the exposure (population) is zero because for those cases the corresponding hazard rate (mu) will most likely be NA in the dataset (unless mu was estimated by other means, like a moving average or smoothing, etc.).  However, it is reasonable to assume that zero exposures correspond to no observed deaths, which is implemented here.  Further, when a \code{fill.method} is specified, then the zero and the missing mortality rates are corrected before calculating the number of deaths.
}
\seealso{
\code{\link[ilc]{insp.dd}}, \code{\link[demography]{extract.ages}}, 
\code{\link[demography]{extract.years}}
}
\examples{
# 'observed' number of deaths (i.e. no data correction)
extract.deaths(dd.cmi.pens, ages=55:100)
# number of deaths with corrections using Perks mortality model
tmp.d <- extract.deaths(dd.cmi.pens, ages=55:100, fill='perks')
# Note: to further improve the plot the user can change the vertical
# axis label and/or main title (amongst other plotting parameters).
plot(tmp.d, transf=FALSE, ylab='Number of Deaths')    # change ylab
plot_dd(tmp.d, transf=FALSE, ylab='Number of Deaths', lpar=list(x.int=-0.2, y.int=0.9, cex=0.85))
plot_dd(tmp.d, y=1995:2003, transf=FALSE, lty=1:5, ylab='Number of Deaths',
  main=paste(tmp.d$lab, ": male (1995-2003)", sep='')) # change main title
}
\keyword{method}
