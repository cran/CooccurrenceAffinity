% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/minmaxAlpha.pFNCH.R
\name{minmaxAlpha.pFNCH}
\alias{minmaxAlpha.pFNCH}
\title{integer-endpoint of range for which BiasedUrn::pFNCHHypergeo() works without error}
\usage{
minmaxAlpha.pFNCH(x, marg)
}
\arguments{
\item{x}{integer co-occurrence count that should properly fall within the closed interval [max(0,mA+mB-N), min(mA,mB)]}

\item{marg}{a 3-entry integer vector (mA,mB,N) consisting of the first row and column totals and the table total for a 2x2 contingency table}
}
\value{
minimum and maximum of Alpha
}
\description{
This function calculates an integer-endpoint of range for which BiasedUrn::pFNCHHypergeo() works without error.
}
\details{
Without this function, BiasedUrn::pFNCHHypergeo() returns inconsistency message for extreme examples like: AlphInts(20,c(204,269,2016), lev=0.9, scal=10).
This problem is solved within our package by restricting the range of allowed alpha to the computed (alphmin, alphmax) range.
}
\examples{
minmaxAlpha.pFNCH(10,c(100,200,300))
minmaxAlpha.pFNCH(20,c(204,269,2016))
minmaxAlpha.pFNCH(20,c(204,269,20160))
}
\references{
Fog, A. (2015), BiasedUrn: Biased Urn Model Distributions. R package version 1.07.

Harkness, W. (1965), “Properties of the extended hypergeometric distribution“, Annals of Mathematical Statistics, 36, 938-945.
}
\author{
Eric Slud
}
