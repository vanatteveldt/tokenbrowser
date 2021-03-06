% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/html_misc.r
\name{add_tag}
\alias{add_tag}
\title{Wrap values in an HTML tag}
\usage{
add_tag(x, tag, attr_str = NULL)
}
\arguments{
\item{x}{a vector of values to be wrapped in a tag}

\item{tag}{A character vector of length 1, specifying the html tag (e.g., "div", "h1", "span")}

\item{attr_str}{A character string of the same length as x (or of length 1).}
}
\value{
a character vector
}
\description{
Wrap values in an HTML tag
}
