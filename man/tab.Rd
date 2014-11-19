\name{tab}
\alias{tab}
\docType{data}
\title{
Sample survival data with additional effects (other than age and time).
}
\description{
An artificial sample of individual observations of survival times along with two additional effects (fictive covariates).
}
\usage{tab}
\format{
Object of class \code{data.frame}
}
\details{
The data set contains the following named columns of fictive individual survival records:
    - 'refno' = unique reference numbers;
    - 'dob' = Julian date corresponding to the date of birth (or origin) of the survival time;
    - 'dev' = Julian date corresponding to date of event (or end) of the survival time.
    - 'event' = binary value corresponding to the survival event (1 - fail/death or 0 - survive);
    - 'cov1' = first additional covariate with 13 levels;
    - 'cov1' = second additional covariate with 4 levels;
}
\source{
NA
}
\seealso{
\code{\link[ilc]{rhdata}}
}
\examples{
# print out the first 10 observations:
tab[1:10,]
# sub-group by a single additional covariate and merge ages above 95:
mdat <- rhdata(tab, covar=c('cov2'), xbreaks=c(40:95, 105), xlabels=c(40:94, '95>'),
  ybreaks=mdy.date(1,1,2000:2007), ylabels=2000:2006, name='M', label='CMI')
mdat
}
\keyword{datasets}
