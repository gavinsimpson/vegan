\name{vegan-package}
\alias{vegan-package}
\alias{vegan}
\docType{package}
\title{
Community Ecology Package: Ordination, Diversity and Dissimilarities
}

\description{ The \pkg{vegan} package provides tools for descriptive
community ecology. It has most basic functions of diversity analysis,
community ordination and dissimilarity analysis. Most of its
multivariate tools can be used for other data types as well.  }

\details{The functions in the \pkg{vegan} package contain tools for
diversity analysis, ordination methods and tools for the analysis of
dissimilarities. Together with the \pkg{labdsv} package, the \pkg{vegan}
package provides most standard tools of descriptive community
analysis. Package \pkg{ade4} provides an alternative comprehensive
package, and several other packages complement \pkg{vegan} and provide
tools for deeper analysis in specific fields. Package
\pkg{BiodiversityR} provides a GUI for a large subset of \pkg{vegan}
functionality.

The \pkg{vegan} package is developed at GitHub
(\url{https://github.com/vegandevs/vegan/}).  GitHub provides up-to-date
information and forums for bug reports.

Most important changes in \pkg{vegan} documents can be read with
\code{news(package="vegan")} and vignettes can be browsed with
\code{browseVignettes("vegan")}. The vignettes include a \pkg{vegan}
FAQ, discussion on design decisions, short introduction to ordination
and discussion on diversity methods.

To see the preferable citation of the package, type
\code{citation("vegan")}.  
}

\author{ The \pkg{vegan} development team is Jari Oksanen,
F. Guillaume Blanchet, Roeland Kindt, Pierre Legendre, Peter
R. Minchin, R. B. O'Hara, Gavin L. Simpson, Peter Solymos, M. Henry
H. Stevens, Helene Wagner.  Many other people have contributed to
individual functions: see credits in function help pages.
}
\examples{
### Example 1: Unconstrained ordination
## NMDS
data(varespec)
data(varechem)
ord <- metaMDS(varespec)
plot(ord, type = "t")
## Fit environmental variables
ef <- envfit(ord, varechem)
ef
plot(ef, p.max = 0.05)
### Example 2: Constrained ordination (RDA)
## The example uses formula interface to define the model
data(dune)
data(dune.env)
## No constraints: PCA
mod0 <- rda(dune ~ 1, dune.env)
mod0
plot(mod0)
## All environmental variables: Full model
mod1 <- rda(dune ~ ., dune.env)
mod1
plot(mod1)
## Automatic selection of variables by permutation P-values
mod <- ordistep(mod0, scope=formula(mod1))
mod
plot(mod)
## Permutation test for all variables
anova(mod)
## Permutation test of "type III" effects, or significance when a term
## is added to the model after all other terms
anova(mod, by = "margin")
## Plot only sample plots, use different symbols and draw SD ellipses 
## for Managemenet classes
plot(mod, display = "sites", type = "n")
with(dune.env, points(mod, disp = "si", pch = as.numeric(Management)))
with(dune.env, legend("topleft", levels(Management), pch = 1:4,
  title = "Management"))
with(dune.env, ordiellipse(mod, Management, label = TRUE))
## add fitted surface of diversity to the model
ordisurf(mod, diversity(dune), add = TRUE)
### Example 3: analysis of dissimilarites a.k.a. non-parametric
### permutational anova
adonis2(dune ~ ., dune.env)
adonis2(dune ~ Management + Moisture, dune.env)
}

\keyword{ package }
\keyword{ multivariate }
\keyword{ univar }
\keyword{ models }
\keyword{ spatial }
\keyword{ nonparametric }
\keyword{ htest }
\keyword{ regression }

