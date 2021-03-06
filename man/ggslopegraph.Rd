% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggslopegraph.R
\name{ggslopegraph}
\alias{ggslopegraph}
\title{Create Slopegraph from a data frame using ggplot2}
\usage{
ggslopegraph(data, main = as.character(substitute(data)), xlim = c(-1L,
  ncol(data) + 2L), ylim = range(data, na.rm = TRUE), xlab = "",
  ylab = "", xlabels = names(data), xbreaks = seq_along(xlabels),
  ybreaks = NULL, yrev = ylim[1] > ylim[2], decimals = NULL,
  col.lines = "black", col.lab = "black", col.num = "black", lwd = 0.5,
  offset.x = 0.1, cex.lab = 3L, cex.num = 3L)
}
\arguments{
\item{data}{An observation-by-period data.frame, with at least two columns. Missing values are allowed.}

\item{main}{A character string specifying a title. Passed to \code{\link[ggplot2]{ggtitle}}.}

\item{xlim}{A two-element numeric vector specifying the y-axis limits.}

\item{ylim}{A two-element numeric vector specifying the y-axis limits.}

\item{xlab}{A character string specifying an x-axis label. Passed to \code{\link[ggplot2]{scale_x_continuous}}.}

\item{ylab}{A character string specifying an y-axis label. Passed to \code{\link[ggplot2]{scale_y_continuous}}, or \code{\link[ggplot2]{scale_y_reverse}} if \code{yrev = TRUE}.}

\item{xlabels}{The labels to use for the slopegraph periods. Default is \code{names(data)}.}

\item{xbreaks}{Passed to \code{breaks} in \code{\link[ggplot2]{scale_x_continuous}}.}

\item{ybreaks}{Passed to \code{breaks} in \code{\link[ggplot2]{scale_y_continuous}}.}

\item{yrev}{A logical indicating whether to use \code{\link[ggplot2]{scale_y_reverse}} rather than the default \code{\link[ggplot2]{scale_y_continuous}}.}

\item{decimals}{The number of decimals to display for values in the plot. Default is \code{NULL} (none).}

\item{col.lines}{A vector of colors for the slopegraph lines. Default is \code{par('fg')}.}

\item{col.lab}{A vector of colors for the observation labels. Default is \code{par('fg')}.}

\item{col.num}{A vector of colors for the number values. Default is \code{par('fg')}.}

\item{lwd}{A vector of line width values for the slopegraph lines.}

\item{offset.x}{A small offset for \code{segments}, to be used when positioning the numeric values. Default is \code{.1}.}

\item{cex.lab}{A numeric value indicating the size of row labels. Default is \code{3}. See \code{\link[ggplot2]{geom_text}}.}

\item{cex.num}{A numeric value indicating the size of numeric labels. Default is \code{3}. See \code{\link[ggplot2]{geom_text}}.}
}
\value{
A \code{\link[ggplot2]{ggplot}} object.
}
\description{
Convert an R data frame (containing a panel dataset, where rows are observations and columns are time periods) into an Edward Tufte-inspired Slopegraph using ggplot2
}
\examples{
require("ggplot2")
## Tufte's Cancer Graph (to the correct scale)
data(cancer)
ggslopegraph(cancer, col.lines = 'gray', 
  xlabels = c('5 Year','10 Year','15 Year','20 Year'))

## Tufte's GDP Graph
data(gdp)
ggslopegraph(gdp, col.line='gray', xlabels = c('1970','1979'), 
    main = 'Current Receipts of Goverment\\nas a Percentage of Gross Domestic Product') + 
  theme_bw()

## Ranking of U.S. State populations
data(states)
ggslopegraph(states, 
  main = 'Relative Rank of U.S. State Populations, 1790-1870', 
  yrev = TRUE)

cls <- rep("black", nrow(states))
cls[rownames(states) == "South Carolina"] <- "red"
cls[rownames(states) == "Tennessee"] <- "blue"
ggslopegraph(states, main = 'Relative Rank of U.S. State Populations, 1790-1870', 
             yrev = TRUE, col.lines = cls, col.lab = cls)

}
\seealso{
For a base graphics version, use \code{\link{slopegraph}}.
}

