\encoding{UTF-8}
\name{permustats}
\alias{permustats}
\alias{permustats.anosim}
\alias{permustats.anova.cca}
\alias{permustats.CCorA}
\alias{permustats.envfit}
\alias{permustats.factorfit}
\alias{permustats.mantel}
\alias{permustats.mrpp}
\alias{permustats.mso}
\alias{permustats.oecosimu}
\alias{permustats.ordiareatest}
\alias{permustats.permutest.betadisper}
\alias{permustats.permutest.cca}
\alias{permustats.protest}
\alias{permustats.vectorfit}
\alias{summary.permustats}
\alias{c.permustats}
\alias{permulattice}
\alias{densityplot.permustats}
\alias{density.permustats}
\alias{qqnorm.permustats}
\alias{qqmath.permustats}
\alias{boxplot.permustats}
\alias{pairs.permustats}

\title{
  Extract, Analyse and Display Permutation Results
}

\description{
  The \code{permustats} function extracts permutation results of
  \pkg{vegan} functions. Its support functions can find quantiles and
  standardized effect sizes, plot densities and Q-Q plots.
}

\usage{
permustats(x, ...)
\method{summary}{permustats}(object, interval = 0.95, alternative, ...)
permulattice(x, plot = c("densityplot", "qqmath"), observed = TRUE,
    axislab = "Permutations", ...)
\method{densityplot}{permustats}(x, data, observed = TRUE,
    xlab = "Permutations", ...)
\method{density}{permustats}(x, observed = TRUE, ...)
\method{qqnorm}{permustats}(y, observed = TRUE, ...)
\method{qqmath}{permustats}(x, data, observed = TRUE, sd.scale = FALSE,
    ylab = "Permutations", ...)
\method{boxplot}{permustats}(x, scale = FALSE, names, ...)
\method{pairs}{permustats}(x, ...)
}

\arguments{
  \item{object, x, y}{The object to be handled.}
  \item{interval}{numeric; the coverage interval reported.}
  \item{alternative}{A character string specifying the limits used for
    the \code{interval} and the direction of the test when evaluating
    the \eqn{p}-values. Must be one of \code{"two.sided"} (both upper
    and lower limit), \code{"greater"} (upper limit), \code{"less"}
    (lower limit). Usually \code{alternative} is given in the result
    object, but it can be specified with this argument.}
  \item{plot}{Use \pkg{lattice} function
    \code{\link[lattice]{densityplot}} or \code{\link[lattice]{qqmath}}.}
  \item{xlab, ylab, axislab}{Label for the axis displaying permutation
    values.}
  \item{observed}{Add observed statistic among permutations.}
  \item{sd.scale}{Scale permutations to unit standard deviation and observed
    statistic to standardized effect size.}
  \item{data}{Ignored.}
  \item{scale}{Use standardized effect size (SES).}
  \item{names}{Names of boxes (default: names of statistics).}
  \item{\dots}{ Other arguments passed to the function. In
    \code{density} these are passed to \code{\link{density.default}},
    and in \code{boxplot} to \code{\link{boxplot.default}}.}
}

\details{

  The \code{permustats} function extracts permutation results and
  observed statistics from several \pkg{vegan} functions that perform
  permutations or simulations.

  The \code{summary} method of \code{permustats} estimates the
  standardized effect sizes (SES) as the difference of observed
  statistic and mean of permutations divided by the standard deviation
  of permutations (also known as \eqn{z}-values). It also prints the
  the mean, median, and limits which contain \code{interval} percent
  of permuted values. With the default (\code{interval = 0.95}), for
  two-sided test these are (2.5\%, 97.5\%) and for one-sided tests
  either 5\% or 95\% quantile and the \eqn{p}-value depending on the
  test direction. The mean, quantiles and \eqn{z} values are evaluated
  from permuted values without observed statistic, but the
  \eqn{p}-value is evaluated with the observed statistic. The
  intervals and the \eqn{p}-value are evaluated with the same test
  direction as in the original test, but this can be changed with
  argument \code{alternative}. Several \code{permustats} objects can
  be combined with \code{c} function. The \code{c} function checks
  that statistics are equal, but performs no other sanity tests.

  The results can be displayed either as conventional graphics or
  \pkg{lattice} graphics. Lattice graphics can be used either with
  function \code{permulattice} or directly with lattice functions
  \code{densityplot} or \code{qqmath}. Function \code{permulattice} can
  be used directly, but for \code{densityplot} and \code{qqmath}
  \pkg{lattice} must be first loaded and attached with
  \code{library(lattice)}
  
  The \code{density} and \code{densityplot} methods display the
  kernel density estimates of permuted values. When observed value of
  the statistic is included in the permuted values, the
  \code{densityplot} method marks the observed statistic as a vertical
  line. However the \code{density} method uses its standard \code{plot}
  method and cannot mark the observed value. Only one statistic can be
  displayed with \code{density} and for several statistics
  \code{permulattice} or \code{densityplot} must be used.

  The \code{qqnorm} and \code{qqmath} methods display Q-Q plots of
  permutations, optionally together with the observed value (default)
  which is shown as horizontal line in plots. \code{qqnorm} plots
  permutation values against standard Normal variate. \code{qqmath}
  defaults to the standard Normal as well, but can accept other
  alternatives (see standard \code{\link[lattice]{qqmath}}). The
  \code{qqmath} function can also plot observed statistic as
  standardized effect size (SES) with standandized permutations
  (argument \code{sd.scale}). The permutations are standardized
  without the observed statistic, similarly as in \code{summary}.
  Only one statistic can be shown with \code{qqnorm} and for several
  statistics \code{permulattice} or \code{qqmath} must be used.

  Function \code{boxplot} draws the box-and-whiskers plots of effect
  size, or the difference of permutations and observed statistic. If
  \code{scale = TRUE}, permutations are standardized to unit standard
  deviation, and the plot will show the standardized effect sizes.

  Function \code{pairs} plots permutation values of statistics against
  each other. The function passes extra arguments to
  \code{\link{pairs}}.

  The \code{permustats} can extract permutation statistics from the
  results of \code{\link{adonis2}},
  \code{\link{anosim}}, \code{\link{anova.cca}}, \code{\link{mantel}},
  \code{\link{mantel.partial}}, \code{\link{mrpp}},
  \code{\link{oecosimu}}, \code{\link{ordiareatest}},
  \code{\link{permutest.cca}}, \code{\link{protest}}, and
  \code{\link{permutest.betadisper}}.

}

\value{
  The \code{permustats} function returns an object of class
  \code{"permustats"}. This is a list of items \code{"statistic"} for
  observed statistics, \code{permutations} which contains permuted
  values, and \code{alternative} which contains text defining the
  character of the test (\code{"two.sided"}, \code{"less"} or
  \code{"greater"}). The \code{\link{qqnorm}} and
  \code{\link{density}} methods return their standard result objects.
}

\author{
  Jari Oksanen with contributions from Gavin L. Simpson
  (\code{permustats.permutest.betadisper} method and related
  modifications to \code{summary.permustats} and the \code{print}
  method) and Eduard \enc{Szöcs}{Szoecs} (\code{permustats.anova.cca).}
}

\seealso{
  \code{\link{density}}, \code{\link[lattice]{densityplot}},
  \code{\link{qqnorm}}, \code{\link[lattice]{qqmath}}, \code{\link{boxplot}}.
}

\examples{
data(dune, dune.env)
mod <- adonis2(dune ~ Management + A1, data = dune.env)
## use permustats
perm <- permustats(mod)
summary(perm)
## lattice graphics
permulattice(perm, "densityplot")
permulattice(perm, "qqmath")
boxplot(perm, scale=TRUE, lty=1, pch=16, cex=0.6, col="hotpink", ylab="SES")
abline(h=0, col="skyblue")
## example of multiple types of statistic
mod <- with(dune.env, betadisper(vegdist(dune), Management))
pmod <- permutest(mod, nperm = 99, pairwise = TRUE)
perm <- permustats(pmod)
summary(perm, interval = 0.90)
}

\keyword{ distribution }
\keyword{ smooth }
