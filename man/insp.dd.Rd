\name{insp.dd}
\alias{insp.dd}
\title{
Miscellaneous utility functions for \code{demogdata} type mortality data
}
\description{
This function can extract any subset of the source data, such as the mortality (hazard) rates and population (exposure), by a given vector of ages and calendar years.  Similarly, the function can output the observed number of deaths by age and calendar years, based on the source data sets included in the \code{demogdata} object.
}
\details{
A subset of mortality rates and population (exposures) can be directly inspected (i.e. extracted) from the corresponding component data matrices in the source \code{demogdata} object by using this function. To inspect the observed number of deaths by age and calendar years the function calls \code{extract.deaths} without data corrections.  
}

\usage{
insp.dd(data, what = c("rate", "pop", "deaths"), ages = data$age, 
		years = data$year, series = names(data$rate)[1])
}
\arguments{
  \item{data}{\code{demogdata} mortality data object}
  \item{what}{specifies the required type of data matrix to be extracted}
  \item{ages}{vector of ages to inspect in the data}
  \item{years}{vector of years to inspect in the data}
  \item{series}{target series name (e.g. 'males') or index number (e.g. 1) of the data object to be extracted}
}
\value{
Returns a subset data matrix of the source data.
}
\author{
Zoltan Butt, Steven Haberman and Han Lin Shang
}
\seealso{
\code{\link[ilc]{extract.deaths}}, \code{\link[demography]{extract.ages}}, \code{\link[demography]{extract.years}}
}
\examples{
# inspect mortality (hazard) rates:
insp.dd(dd.cmi.pens, 'rate', age=50:80, year=1985:1990)
# inspect exposure (population) values:
insp.dd(dd.cmi.pens, 'pop', age=50:80, year=1985:1990)
# inspect 'estimated' number of deaths
insp.dd(dd.cmi.pens, 'deaths', age=50:80, year=1985:1990)
}
\keyword{methods}
