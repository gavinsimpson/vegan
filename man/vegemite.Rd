\name{vegemite}
\alias{vegemite}
\alias{tabasco}
\alias{coverscale}

\title{Display Compact Ordered Community Tables }
\description{
  Functions \code{vegemite} and \code{tabasco} display compact
  community tables.  Function \code{vegemite} prints text tables where
  species are rows, and each site takes only one column without
  spaces.  Function \code{tabasco} provides interface for
  \code{\link{heatmap}} for a colour \code{\link{image}} of the
  data. The community table can be ordered by explicit indexing, by
  environmental variables or results from an ordination or cluster
  analysis.
}
\usage{
vegemite(x, use, scale, sp.ind, site.ind, zero=".", select,
    diagonalize = FALSE, ...)
tabasco(x, use, sp.ind = NULL, site.ind = NULL, select,
    Rowv = TRUE, Colv = TRUE, labRow = NULL, labCol = NULL,
    scale, col = heat.colors(12), ...)
coverscale(x, scale=c("Braun.Blanquet", "Domin", "Hult", "Hill", "fix","log"),
           maxabund, character = TRUE)
}

\arguments{
  \item{x}{Community data. }
  \item{use}{Either a numeric vector or a classification factor, or an
    object from \code{cca}, \code{decorana} \emph{etc.} or \code{hclust}
    or a \code{\link{dendrogram}} for ordering sites and species.}
  \item{sp.ind, site.ind}{Species and site indices. In \code{tabasco},
    these can also be \code{\link{hclust}} tree,
    \code{\link[cluster]{agnes}} clusterings or
    \code{\link{dendrogram}}s. }
  \item{zero}{Character used for zeros. }
  \item{select}{Select a subset of sites.  This can be a logical vector
    (\code{TRUE} for selected sites), or a vector of indices of selected
    sites.  The order of indices does not influence results, but you
    must specify \code{use} or \code{site.ind} to reorder sites.
  }

  \item{diagonalize}{Try to re-order \code{vegemite} table to a diagonal
    pattern when using classification factor or a dendrogram.
    Dendrograms are re-orded by the first axis of correspondence
    analysis.  Factor levels and sites within factor levels are
    re-ordered by the first axis of (constrained) correspondence
    analysis.}

  \item{Rowv, Colv}{Re-order factors or dendrograms for the rows (sites)
    or columns (species) of \code{x}.  If \code{Rowv = TRUE}, factor
    levels and sites within factors are re-ordered to show diagonal
    pattern using CCA. If \code{Rowv = TRUE}, row dendrograms are
    ordered by the first axis of correspondence analysis, and when
    \code{Colv = TRUE} column dendrograms by the weighted average
    (\code{\link{wascores}}) of the row order.  Alternatively, the
    arguments can be vectors that are used to reorder the dendrogram. }

  \item{labRow, labCol}{character vectors with row and column labels
    used in the \code{\link{heatmap}} instead of the default. NB., the
    input matrix is transposed so that row labels will be used for data
    columns.}

  \item{scale}{In \code{vegemite} and \code{coverscale}: cover scale
    used (can be abbreviated). In \code{tabasco}: scaling of colours
    in \code{\link{heatmap}}. The alternatives of \code{coverscale}
    can be used in \code{tabasco}, and in addition \code{"column"} or
    \code{"row"} scale columns or rows to equal maxima (NB., these
    refer to the transposed data of the \code{\link{heatmap}}), while
    \code{"none"} uses original values. }

  \item{col}{A vector of colours used for above-zero abundance values.}

  \item{maxabund}{Maximum abundance used with \code{scale = "log"}.
    Data maximum in the \code{select}ed subset will be used if this is
    missing.}

  \item{character}{Return character codes suitable for tabulation in
    \code{vegemite}. If \code{FALSE}, returns corresponding
    integers suitable for numerical analysis.}

  \item{\dots}{Arguments passed to \code{coverscale} (i.e., \code{maxabund}) in
    \code{vegemite} and to \code{\link{heatmap}} in \code{tabasco}.}
}
\details{
  The function \code{vegemite} prints a traditional community table.
  The display is transposed, so that species are in rows and sites in
  columns.  The table is printed in compact form: only one character
  can be used for abundance, and there are no spaces between
  columns. Species with no occurrences are dropped from the table.

  Function \code{tabasco} produces a similar table as \code{vegemite}
  using \code{\link{heatmap}}, where abundances are coded by
  colours. The function scales the abundances to equal intervals for
  colour palette, but either rows or columns can be scaled to equal
  maxima, or the \code{coverscale} class systems can be used. The
  function can also display dendrograms for sites (columns) or species
  if these are given as an argument (\code{use} for sites,
  \code{sp.ind} for species).

  The parameter \code{use} will be used to re-order output. The
  \code{use} can be a vector or an object from \code{\link{hclust}} or
  \code{\link[cluster]{agnes}}, a \code{\link{dendrogram}} or any
  ordination result recognized by \code{\link{scores}} (all ordination
  methods in \pkg{vegan} and some of those not in \pkg{vegan}). The
  \code{\link{hclust}}, \code{\link[cluster]{agnes}} and
  \code{\link{dendrogram}} must be for sites. The dendrogram is
  displayed above the sites in \code{tabasco}, but is not shown in
  \code{vegemite}.  In \code{tabasco} the species dendrogram can be
  given in \code{sp.ind}.

  If \code{use} is a numeric vector, it is used for ordering sites,
  and if it is a factor, it is used to order sites by classes. If
  \code{use} is an object from ordination, both sites and species are
  arranged by the first axis (provided that results are available also
  for species).  When \code{use} is an object from
  \code{\link{hclust}}, \code{\link[cluster]{agnes}} or a
  \code{\link{dendrogram}}, the sites are ordered similarly as in the
  cluster dendrogram.  Function \code{tabasco} re-orders the
  dendrogram to give a diagonal pattern if \code{Rowv =
  TRUE}. Alternatively, if \code{Rowv} is a vector its values are used
  to re-order dendrogram. With \code{diagonalize = TRUE} the
  dendrogram will be re-ordered in \code{vegemite} to give a diagonal
  pattern. If \code{use} is a factor, its levels and sites within
  levels will be reordered to give a diagonal pattern if
  \code{diagonalize = TRUE} in \code{vegemite} or \code{Rowv = TRUE}
  in \code{tabasco}. In all cases where species scores are missing,
  species are ordered by their weighted averages
  (\code{\link{wascores}}) on site order or site value.

  Species and sites can be ordered explicitly giving their indices or
  names in parameters \code{sp.ind} and \code{site.ind}.  If these are
  given, they take precedence over \code{use}. A subset of sites can
  be displayed using argument \code{select}, but this cannot be used
  to order sites, but you still must give \code{use} or
  \code{site.ind}.  However, \code{tabasco} makes two exceptions:
  \code{site.ind} and \code{select} cannot be used when \code{use} is
  a dendrogram (clustering result). In addition, the \code{sp.ind} can
  be an \code{\link{hclust}} tree, \code{\link[cluster]{agnes}}
  clustering or a \code{\link{dendrogram}}, and in that case the
  dendrogram is plotted on the left side of the
  \code{\link{heatmap}}. Phylogenetic trees cannot be directly used,
  but package \pkg{ape} has tools to transform these to
  \code{\link{hclust}} trees.

  If \code{scale} is given, \code{vegemite} calls \code{coverscale} to
  transform percent cover scale or some other scales into traditional
  class scales used in vegetation science (\code{coverscale} can be
  called directly, too). Function \code{tabasco} can also use these
  traditional class scales, but it treats the transformed values as
  corresponding integers.  Braun-Blanquet and Domin scales are
  actually not strict cover scales, and the limits used for codes
  \code{r} and \code{+} are arbitrary.  Scale \code{Hill} may be
  inappropriately named, since Mark O. Hill probably never intended
  this as a cover scale.  However, it is used as default \dQuote{cut levels}
  in his \code{TWINSPAN}, and surprisingly many users stick to this
  default, and this is a \emph{de facto} standard in publications.
  All traditional scales assume that values are cover percentages with
  maximum 100.  However, non-traditional alternative \code{log} can be
  used with any scale range.  Its class limits are integer powers of
  1/2 of the maximum (argument \code{maxabund}), with \code{+} used
  for non-zero entries less than 1/512 of the maximum (\code{log}
  stands alternatively for logarithmic or logical).  Scale \code{fix}
  is intended for \dQuote{fixing} 10-point scales: it truncates scale values
  to integers, and replaces 10 with \code{X} and positive values below
  1 with \code{+}.  }

\value{The functions are used mainly to display a table, but they return
  (invisibly) a list with items \code{species} for ordered species
  index, \code{sites} for ordered site index, and \code{table} for the
  final ordered community table.

  These items can be used as arguments \code{sp.ind} and \code{site.ind}
  to reproduce the table, or the \code{table} can be further edited. In
  addition to the table, \code{vegemite} prints the numbers of species
  and sites and the name of the used cover scale.
}

\references{ The cover scales are presented in many textbooks of vegetation
  science; I used:

  Shimwell, D.W. (1971) \emph{The Description and Classification of
  Vegetation}. Sidgwick & Jackson.
}
\author{Jari Oksanen}

\seealso{\code{\link{cut}} and \code{\link{approx}} for making your
  own \sQuote{cover scales} for \code{vegemite}.  Function
  \code{tabasco} is based on \code{\link{heatmap}} which in turn is
  based on \code{\link{image}}. Both functions order species with
  weighted averages using \code{\link{wascores}}.  }

\note{

  The name \code{vegemite} was chosen because the output is so
  compact, and the \code{tabasco} because it is just as compact, but
  uses heat colours.

}
\examples{
data(varespec)
## Print only more common species
freq <- apply(varespec > 0, 2, sum)
vegemite(varespec, scale="Hult", sp.ind = freq > 10)
## Order by correspondence analysis, use Hill scaling and layout:
dca <- decorana(varespec)
vegemite(varespec, dca, "Hill", zero="-")
## Show one class from cluster analysis, but retain the ordering above
clus <- hclust(vegdist(varespec))
cl <- cutree(clus, 3)
sel <- vegemite(varespec, use=dca, select = cl == 3, scale="Br")
## Re-create previous
vegemite(varespec, sp=sel$sp, site=sel$site, scale="Hult")
## Re-order clusters by ordination
clus <- as.dendrogram(clus)
clus <- reorder(clus, scores(dca, choices=1, display="sites"), agglo.FUN = mean)
vegemite(varespec, clus, scale = "Hult")

## Abundance values have such a wide range that they must be rescaled
tabasco(varespec, dca, scale="Braun")

## Classification trees for species
data(dune, dune.taxon)
taxontree <- hclust(taxa2dist(dune.taxon))
plotree <- hclust(vegdist(dune), "average")
## Automatic reordering of clusters
tabasco(dune, plotree, sp.ind = taxontree)
## No reordering of taxonomy
tabasco(dune, plotree, sp.ind = taxontree, Colv = FALSE)
## Species cluster: most dissimilarity indices do a bad job when
## comparing rare and common species, but Raup-Crick makes sense
sptree <- hclust(vegdist(t(dune), "raup"), "average")
tabasco(dune, plotree, sptree)
}
\keyword{print}
\keyword{manip}
\keyword{hplot}
