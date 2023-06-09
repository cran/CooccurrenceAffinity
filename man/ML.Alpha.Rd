% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ML.Alpha.R
\name{ML.Alpha}
\alias{ML.Alpha}
\title{Maximum likelihood estimate and intervals of alpha, null expectation and p-value of a 2x2 table}
\usage{
ML.Alpha(
  x,
  marg,
  bound = TRUE,
  scal = log(2 * marg[3]^2),
  lev = 0.95,
  pvalType = "Blaker"
)
}
\arguments{
\item{x}{integer co-occurrence count that should properly fall within the closed interval [max(0,mA+mB-N), min(mA,mB)]}

\item{marg}{a 3-entry integer vector (mA,mB,N) consisting of the first row and column totals and the table total for a 2x2 contingency table}

\item{bound}{a boolean parameter which when TRUE replaces the MLE of "+/-Infinity", applicable when x is respectively at the upper extreme min(mA,mB)
or the lower extreme max(mA+mB-N,0) of its possible range, by a finite value with absolute value upper-bounding the value of
MLEs attainable for values of x not equal to its extremes}

\item{scal}{an integer parameter (default 2*N^2, capped at 10 within the function) that should be 2 or greater}

\item{lev}{a confidence level, generally somewhere from 0.8 to 0.95  (default 0.95)}

\item{pvalType}{a character string telling what kind of p-value to calculate. ‘Blaker’ or “midP’.
If ‘pvalType=Blaker” (the default value), the p-value is calculated according to "Acceptability" function of Blaker (2000).
If ‘pvalType=midP’, the p-value is calculated using the same idea as the midP confidence interval.}
}
\value{
This function returns maximum likelihood estimate of alpha, the interval-endpoints of alpha values for which x is a median,
and four confidence intervals for alpha, described in detail under documentation for AlphInts().
In addition there are two output list-components for the null-distribution expected co-occurrence count and the p-value
for the test of the null hypothesis alpha=0, calculated as in AlphInts.
}
\description{
This function calculates the maximum likelihood estimate and other quantities computed in AlphInts(),
for the log-odds parameter alpha in the Extended Hypergeometric distribution with fixed margins (mA,mB) and
table-total N, which is the "log-affinity" index of co-occurrence championed in a paper by Mainali et al. (2022) as an index of co-occurrence-based similarity.
}
\details{
This function calculates the maximum likelihood estimate of the log-odds paramater alpha within the Extended Hypergeometric distribition (Harkness 1965)
based on the count x and fixed table margins (mA,mB) and total N, which is the "affinity" index of co-occurrence championed in the paper of Mainali et al. (2022)
as an index of cooccurrence-based similarity, along with the intervals computed in AlphInts, called CI.CP, CI.Balker, CI.midQ and CI.midP.
The boolean "bound" parameter is an option to prevent the intervals containing alpha-estimates to extend to plus or minus infinity, based on a Bayesian argument. T
he bound substituted for the Infinite endpoints is provably larger than the largest value the MLE can take whenever x avoids the enpoints max(mA+mB-N,0) and min(mA,mB)
of its logical range. The recommended confidence interval for alpha is CI.Blaker if a reliably conservative (over-large) coverage probability is desired, and CI.midP otherwise.
}
\examples{
unlist(ML.Alpha(30,c(50,80,120), lev=0.9))
AlphInts(30,c(50,80,120), lev=0.9)

AlphInts(61,c(80,80,100), lev=0.9)
ML.Alpha(61,c(80,80,100), lev=0.9)

# Alpha capped warning examples
AlphInts(60,c(80,80,100), lev=0.9)
ML.Alpha(60,c(80,80,100), lev=0.9)

AlphInts(80,c(80,80,100), lev=0.9)
ML.Alpha(80,c(80,80,100), lev=0.9)

# impossible x warning examples
AlphInts(81,c(80,80,100), lev=0.9)
ML.Alpha(81,c(80,80,100), lev=0.9)

# Degenerate distribution warning example
AlphInts(80,c(80,100,100), lev=0.9)
ML.Alpha(80,c(80,100,100), lev=0.9)
}
\references{
Fog, A. (2015), BiasedUrn: Biased Urn Model Distributions. R package version 1.07.

Harkness, W. (1965), “Properties of the extended hypergeometric distribution“, Annals of Mathematical Statistics, 36, 938-945.

Mainali, K., Slud, E., Singer, M. and Fagan, W. (2022), "A better index for analysis of co-occurrence and similarity", Science Advances, to appear.
}
\author{
Eric Slud
}
