#' Quantile of the Extended Hypergeometric distribution approximated by the midP distribution function
#'
#' This function does the analogous calculation to that of EHypQuInt, but with the Extended Hypergeometric distribution
#' function F(x) = F(x,mA,mB,N, exp(alpha)) replaced by (F(x) + F(x-1))/2.
#'
#' @details  This function does the analogous calculation to that of CI.CP, but with the Extended Hypergeometric distribution
#' function F(z, alpha) = F(z,mA,mB,N, exp(alpha)) replaced by (F(z,alpha) + F(z-1,alpha))/2.
#'
#' @param x integer co-occurrence count that should properly fall within the closed interval \[max(0,mA+mB-N), min(mA,mB)\]
#' @param marg a 3-entry integer vector (mA,mB,N) consisting of the first row and column totals and the table total for a 2x2 contingency table
#' @param lev a confidence level, generally somewhere from 0.8 to 0.95  (default 0.95)
#'
#' @return This function returns the interval of alpha values with endpoints
#' (F(x,alpha)+F(x-1,alpha))/2 = (1+lev)/2   and  (F(x,alpha)+F(x+1,alpha))/2 = (1-lev)/2.
#'
#' The idea of calculating a Confidence Interval this way is analogous to the midP CI used for unknown binomial proportions (Agresti 2013, p.605).
#'
#' @author Eric Slud
#'
#' @references
#' Agresti, A. (2013) Categorical Data Analysis, 3rd edition, Wiley.
#'
#' @example
#' inst/examples/EHypMidP_example.R
#'
#' @export

EHypMidP <-
  function(x, marg, lev) {
    mA=marg[1]; mB=marg[2]; N=marg[3]
    if(length(intersect(c(mA,mB), c(0,N))))
      return("Degenerate co-occurrence distribution!")
    ## cap absmax at 10 to avoid error in pFNCHypergeo
    alprng = minmaxAlpha.pFNCH(x,marg)
    alpmax = min(log(2*N^2),alprng[2])
    alpmin = max(-log(2*N^2),alprng[1])
    ## NB. This function can fail to find interval when the
    #   marg  numbers are very large and the x value too extreme.
    #   In that case, the midQ interval is used in place of midP.
    midP.EHyp = function(alp)  BiasedUrn::pFNCHypergeo(x,mA,N-mA,mB,exp(alp))-0.5*
      BiasedUrn::dFNCHypergeo(x,mA,N-mA,mB,exp(alp))
    lower = if(x==max(mA+mB-N,0)) alpmin else  {
      tmp = try(uniroot(function(alp) midP.EHyp(alp) - (1+lev)/2,
                        c(alpmin,alpmax)), silent=T)
      # if(class(tmp)!="try-error") tmp$root else NA}
      if(!inherits(tmp, "try-error")) tmp$root else NA}
    upper = if(x==min(mA,mB)) alpmax else   {
      tmp = try(uniroot(function(alp) midP.EHyp(alp) - (1-lev)/2,
                        c(alpmin,alpmax)), silent=T)
      # if(class(tmp)!="try-error") tmp$root else NA}
      if(!inherits(tmp, "try-error")) tmp$root else NA}
    if(is.na(lower+upper)) NA else c(lower,upper) }
