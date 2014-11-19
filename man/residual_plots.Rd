\name{residual_plots}
\alias{residual_plots}
\title{
Miscellaneous plotting functions for \code{lca} and \code{lca.rh} type regression objects.
}
\description{
A diagnostic plot with three graphical regions showing the residual values by the given ages, calendar years and (cohort) years of birth.
}
\usage{
residual_plots(lca.obj, file = paste("res", deparse(substitute(lca.obj)), 
				"ps", sep = "."), view = T)
}
\arguments{
  \item{lca.obj}{an object of class \code{lca}}
  \item{file}{an optional string value indicating the output postscript file name (i.e. with extension .ps).  By default, it concatenates "res." and the model object name (with extension ".ps"). If it is set to NULL, the plot will be sent instead to the active graphical window.}
  \item{view}{logical, if TRUE (and \code{file} argument is not NULL) then Ghostview will be launched with the created .ps file}
}
\value{
Diagnostic plot of the residual values of a Lee-Carter model object.
}
\author{
Zoltan Butt, Steven Haberman and Han Lin Shang
}
\seealso{
\code{\link{fitted_plots}}, \code{\link[ilc]{lca.rh}}
}
\examples{
mod6d <- lca.rh(dd.cmi.pens, mod='lc', restype='dev', interpolate=TRUE)
# send fitted plots with legends to 'res.mod6.ps' file:
residual_plots(mod6d)
# send fitted plots to active graphics window
residual_plots(mod6d, file=NULL)
}
\keyword{plots}
