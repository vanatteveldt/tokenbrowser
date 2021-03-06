% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tag_tokens.r
\name{tag_tokens}
\alias{tag_tokens}
\title{add span tags to tokens}
\usage{
tag_tokens(tokens, tag = "span", ...)
}
\arguments{
\item{tokens}{a vector of tokens}

\item{...}{named arguments are used as attributes in the span tag for each token, with the name being the name
of the attribute (e.g., class, . Each argument must be a vector of the same length as the number of tokens.
NA values can be used to ignore attribute for a token, and if a token has NA for each attribute,
it is not given a span tag.}
}
\value{
a character vector of tagged tokens
}
\description{
This is the main function for adding colors, onclick effects, etc. to tokens, for which <span> tags are used. The named arguments are used to set the attributes.
}
\details{
If a token does not have any attributes, the <span> tag is not added.

Note that the attr_style() function can be used to conveniently set the style attribute. Also, the set_col(), highlight_col() and scale_col() functions can be used to set the color of style attributes. See the example for illustration.
}
\examples{
tag_tokens(tokens = c('token_1','token_2', 'token_3'),
           class = c(1,1,2),
           style = attr_style(color = set_col('red'),
                              `background-color` = highlight_col(c(FALSE,FALSE,TRUE))))

## tokens without attributes are not given a span tag
tag_tokens(tokens = c('token_1','token_2', 'token_3'),
           class = c(1,NA,NA),
           style = attr_style(color = highlight_col(c(TRUE,TRUE,FALSE))))
}
