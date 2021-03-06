% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colorize.r
\name{set_col}
\alias{set_col}
\title{Transpose a color into the string format used in html attributes}
\usage{
set_col(col, alpha = 1)
}
\arguments{
\item{col}{The name of the color}

\item{alpha}{Optionally, the alpha (transparency), with 0 being fully
transparent and 1 being fully colorized.}
}
\value{
The string used to specify a color in an html tag attribute
}
\description{
Transpose a color into the string format used in html attributes
}
\examples{
set_col('red')
set_col('red', alpha=0.5)
}
