\name{ilc-package}
\alias{ilc-package}
\alias{ilc}
\docType{package}
\title{
Generalised Lee-Carter models using iterative fitting algorithms
}
\description{
The package implements a specialised iterative regression method for the analysis of age-period mortality based on a class of generalised Lee-Carter type modelling structure. Within the modelling framework of Renshaw and Haberman (2006), we use a Newton-Raphson iterative process to generate parameter estimates based on Poisson (or Gaussian) likelihood. In addition, we develop and implement here a stratified Lee-Carter model.
}
\details{
The package contains methods for the analysis of a class of six different types of log-linear models in the GLM framework with Poisson or Gaussian errors that includes the basic LC model too. Also, this package includes tools for the fitting and analysis of the stratified LC model using an additional covariate (other than age and period).  There are also made available some general diagnostic tools to analyse the data and the graduation results.
}
\author{
Zoltan Butt, Steven Haberman and Han Lin Shang

Maintainer: Zoltan Butt <Z.Butt@city.ac.uk>
}
\references{
Lee, R. and Carter, L. (1992), ``Modelling and forecasting U.S. mortalit'', \emph{Journal of the American Statistical Association} \bold{87}, 659-671.

Lee, L. (2000), ``The Lee-Carter method for forecasting mortality, with various extensions and applications'', \emph{North American Actuarial Journal} \bold{4}, 80-93.

Renshaw, A. E. and Haberman, S. (2003a), ``Lee-Carter mortality forecasting: a parallel generalised linear modelling approach for England and Wales mortality projections'', \emph{Journal of the Royal Statistical Society, Series C}, \bold{52}(1), 119-137.

Renshaw, A. E. and Haberman, S. (2003b), ``Lee-Carter mortality forecasting with age specific enhancement'', \emph{Insurance: Mathematics and Economics}, \bold{33}, 255-272.

Renshaw, A. E. and Haberman, S. (2006), ``A cohort-based extension to the Lee-Carter model for mortality reduction factors'', \emph{Insurance: Mathematics and Economics}, \bold{38}, 556-570.

Renshaw, A. E. and Haberman, S. (2008), ``On simulation-based approaches to risk measurement in mortality with specific reference to Poisson Lee-Carter modelling'', \emph{Insurance: Mathematics and Economics}, \bold{42}(2), 797-816.

Renshaw, A. E. and Haberman, S. (2009),  ``On age-period-cohort parametric mortality rate projections'', \emph{Insurance: Mathematics and Economics}, \bold{45}(2), 255-270.
}
\keyword{package}
