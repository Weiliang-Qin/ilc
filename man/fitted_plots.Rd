\name{fitted_plots}
\alias{fitted_plots}
\title{
Miscellaneous plotting functions for \code{lca} and \code{lca.rh} type regression objects
}
\description{
A diagnostic plot with two graphical regions showing the fitted log rates by the given ages and calendar years.
}
\usage{
fitted_plots(lca.obj, file = paste("fit", deparse(substitute(lca.obj)), 
			 "ps", sep = "."), view = T, labs = T, col)
}
\arguments{
  \item{lca.obj}{an object of class \code{lca.rh}}
  \item{file}{an optional string value indicating the output postscript file name (i.e. with extension .ps).  By default, it concatenates "fit." and the model object name (with extension ".ps"). If it is set to NULL, the plot will be sent instead to the active graphical window}
  \item{view}{logical, if TRUE (and \code{file} argument is not NULL) then Ghostview will be launched with the created .ps file}
  \item{labs}{logical, if TRUE, it adds age/years text labels to fitted curves}
  \item{col}{color palette to be used in the plot}
}
\value{
Diagnostic plots of fitted curves by age and by calendar year of a Lee-Carter model object.
}
\author{
Z. Butt and S. Haberman and H. L. Shang
}
\seealso{
\code{\link{residual_plots}}, \code{\link[ilc]{lca.rh}}
}
\examples{
mod6 <- lca.rh(dd.cmi.pens, mod='lc', max=110)
# send fitted plots with legends to 'fit.mod6.ps' file:
fitted_plots(mod6)
# send fitted plots without legends to active graphics window
fitted_plots(mod6, file=NULL, labs=FALSE)
}
\keyword{plots}