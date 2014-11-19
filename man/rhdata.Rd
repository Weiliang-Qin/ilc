\name{rhdata}
\alias{rhdata}
\title{
Data formatting utility for the extended (Stratified) LC model function
}
\description{
It creates \code{rhdata} class object suitable for fitting the extended SLC model using \code{elca.rh} iterative fitting method.  Basically, it transforms a two-dimensional survival data into three-dimensional arrays of population (exposure) and mortality rates dependent on age, calendar time and additional covariate(s).
}
\usage{
rhdata(dat, covar, xbreaks = 60:96, xlabels = 60:95, 
		ybreaks = mdy.date(1, 1, 1999:2008), ylabels = 1999:2007, 
		name = NULL, label = NULL)
}
\arguments{
  \item{dat}{\code{data.frame} containing individual observations of survival data along with values of additional covariate(s). Thus, the data set needs to contain the following  named columns of individual survival records:
    - 'event' = binary value corresponding to the survival event (1 - fail/death or 0 - survive);
    - 'dob' = Julian date corresponding to the date of birth (or origin) of the survival time;
    - 'dev' = Julian date corresponding to date of event (or end) of the survival time.
    In addition, there should be at least one extra column corresponding to observations related to any additional covariate(s) (e.g. socio-economic factors).}
  \item{covar}{(partial) covariate name(s) or position number(s) in the \code{dat} data set.  The covariate(s) must be of class 'factor'.}
  \item{xbreaks}{a sequence of age break points (including the starting and closing values) to be used for sub-grouping the input data set \code{dat} in order to calculate age-specific exposures and mortality rates. By default, it is set to \code{60:96} that corresponds to integer ages between 60 - 95.}
  \item{xlabels}{a sequence of age labels to be used for the sequence defined in \code{xbreaks}.}
  \item{ybreaks}{a sequence of year break points (as Julian calendar dates) to be used for sub-grouping the input data set \code{dat} in order to calculate year-specific exposures and mortality rates. By default, it is set to \code{mdy.date(1, 1, 1999:2008)} that corresponds to whole years between 1st of January of years 1999 - 2008.}
  \item{ylabels}{a sequence of year labels to be used for the sequence defined in \code{ybreaks}.}
  \item{name}{name of subset data series (e.g. male, female or total)}
  \item{label}{label (name) of overall data source (e.g. CMI)}
}
\details{
While the \code{rhdata} function can sub-group the input data by more than one additional covariates (possibly useful for other preliminary analysis), the fitting method implemented in \code{elc.rh} can only handle a single additional covariate. Also, currently, there are no generic methods to plot or to extract parts of the \code{rhdata} class object, but there are a few illustrations provided below how these might be carried out.
}
\value{
List object defined as class \code{rhdata} made up by the following components:
\item{year}{vector of year labels}
\item{age}{vector of age labels}
\item{covariates}{vector of levels of the additional covariate}
\item{deaths}{3-dimensional array of number of deaths (by age-year-covariate)}
\item{pop}{3-dimensional array of population (exposure) (by age-year-covariate)}
\item{mu}{3-dimensional array of central mortality rates (by age-year-covariate)}
\item{label}{label (name) of overall data source}
\item{name}{name of subset data series }
}
\references{
Renshaw, A. E. and Haberman, S. (2003a), ``Lee-Carter mortality forecasting: a parallel generalised linear modelling approach for England and Wales mortality projections", \emph{Journal of the Royal Statistical Society, Series C}, \bold{52}(1), 119-137.

Renshaw, A. E. and Haberman, S. (2003b), ``Lee-Carter mortality forecasting with age specific enhancement", \emph{Insurance: Mathematics and Economics}, \bold{33}, 255-272.

Renshaw, A. E. and Haberman, S. (2006), ``A cohort-based extension to the Lee-Carter model for mortality reduction factors", \emph{Insurance: Mathematics and Economics}, \bold{38}, 556-570. 

Renshaw, A. E. and Haberman, S. (2008), ``On simulation-based approaches to risk measurement in mortality with specific reference to Poisson Lee-Carter modelling", \emph{Insurance: Mathematics and Economics}, \bold{42}(2), 797-816.

Renshaw, A. E. and Haberman, S. (2009),  ``On age-period-cohort parametric mortality rate projections", \emph{Insurance: Mathematics and Economics}, \bold{45}(2), 255-270.
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link{elca.rh}}, \code{\link{dd.rfp}}, \code{\link[demography]{demogdata}}, \code{\link[date]{mdy.date}}
}
\examples{
# See data set 'tab' provided in the ilc package
# names(tab)
# [1] "refno" "dob"   "dev"   "event" "cov1"  "cov2"
# Get multidimensional survival data: 
mdat <- rhdata(tab, covar='cov2', xbreaks=60:96, xlabels=60:95,
  ybreaks=mdy.date(1,1,2000:2006), ylabels=2000:2005, name='M', label='CMI')
# Warning: although rhdata() can sort by more than a single parameter, for ex.
#   covar=c('cov1', 'cov2'), the SLC fitting only works at the moment with
#   a single extra covariate.

# print data summary:
mdat
#Multidimensional Mortality data for: MDat [M] 
#Across covariates:
#         years: 2000 - 2005
#         ages:  60 - 95
#         cov2: 0, 1, 2, 3
# Graphical illustrations of mdat data levels (by the additional factor):
# plot of exposures:
matplot(mdat$age, mdat$pop[,,1], type='l', xlab='Age', ylab='Ec', main='Base Level')
matplot(mdat$age, mdat$pop[,,2], type='l', xlab='Age', ylab='Ec', main='Level 1')
# plot of deaths:
matplot(mdat$age, mdat$deaths[,,1], type='l', xlab='Age', ylab='D', main='Base Level')
matplot(mdat$age, mdat$deaths[,,2], type='l', xlab='Age', ylab='D', main='Level 1')
# plot of log mortality rates:
matplot(mdat$age, log(mdat$mu[,,1]), type='l', xlab='Age', ylab='log(mu)', main='Base Level')
matplot(mdat$age, log(mdat$mu[,,2]), type='l', xlab='Age', ylab='log(mu)', main='Level 1')
}
\keyword{method}
