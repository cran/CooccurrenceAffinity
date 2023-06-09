% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/affinity2by2.R
\name{affinity2by2}
\alias{affinity2by2}
\title{Maximum likelihood estimate and intervals of alpha, null expectation, p-value and traditional indices from a 2x2 table}
\usage{
affinity2by2(
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
four confidence intervals for alpha, described in detail under documentation for AlphInts(), and traditional indices of Jaccard, Sorenson and Simpson.
In addition there are two output list-components for the null-distribution expected co-occurrence count and the p-value
for the test of the null hypothesis alpha=0, calculated as in AlphInts.
}
\description{
This function uses ML.Alpha() and supplements to the outcome with traditional indices of Jaccard, Sorenson, and Simpson.
ML.Alpha() calculates the maximum likelihood estimate and other quantities computed in AlphInts(),
for the log-odds parameter alpha in the Extended Hypergeometric distribution with fixed margins (mA,mB) and
table-total N, which is the "log-affinity" index of co-occurrence championed in a paper by Mainali et al. (2022) as an index of co-occurrence-based similarity.
}
\details{
See the details of ML.Alpha(). In addition to the output of ML.Alpha, this function also computes Jaccard, Sorenson and Simpson indices.
}
\examples{
ML.Alpha(x=35, c(mA=50, mB=70, N=150), lev=0.95)
affinity2by2(x=35, c(mA=50, mB=70, N=150), lev=0.95)
# ML.Alpha() is a subset of affinity2by2()
a <- ML.Alpha(x=35, c(mA=50, mB=70, N=150), lev=0.95)
b <- affinity2by2(x=35, c(mA=50, mB=70, N=150), lev=0.95)
identical(a, b[1:11])
}
\references{
Fog, A. (2015), BiasedUrn: Biased Urn Model Distributions. R package version 1.07.

Harkness, W. (1965), “Properties of the extended hypergeometric distribution“, Annals of Mathematical Statistics, 36, 938-945.

Mainali, K., Slud, E., Singer, M. and Fagan, W. (2022), "A better index for analysis of co-occurrence and similarity", Science Advances, to appear.
}
\author{
Kumar Mainali and Eric Slud
}
