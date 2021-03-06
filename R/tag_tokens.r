## wrapping tokens in span attributes

#' add span tags to tokens
#'
#' This is the main function for adding colors, onclick effects, etc. to tokens, for which <span> tags are used. The named arguments are used to set the attributes.
#'
#' If a token does not have any attributes, the <span> tag is not added.
#'
#' Note that the attr_style() function can be used to conveniently set the style attribute. Also, the set_col(), highlight_col() and scale_col() functions can be used to set the color of style attributes. See the example for illustration.
#'
#' @param tokens  a vector of tokens
#' @param ...     named arguments are used as attributes in the span tag for each token, with the name being the name
#'                of the attribute (e.g., class, . Each argument must be a vector of the same length as the number of tokens.
#'                NA values can be used to ignore attribute for a token, and if a token has NA for each attribute,
#'                it is not given a span tag.
#'
#' @return a character vector of tagged tokens
#' @export
#'
#' @examples
#' tag_tokens(tokens = c('token_1','token_2', 'token_3'),
#'            class = c(1,1,2),
#'            style = attr_style(color = set_col('red'),
#'                               `background-color` = highlight_col(c(FALSE,FALSE,TRUE))))
#'
#' ## tokens without attributes are not given a span tag
#' tag_tokens(tokens = c('token_1','token_2', 'token_3'),
#'            class = c(1,NA,NA),
#'            style = attr_style(color = highlight_col(c(TRUE,TRUE,FALSE))))
tag_tokens <- function(tokens, tag='span', ...) {
  attr_str = tag_attr(...)
  if (is.null(attr_str)) return(tokens)
  if (length(attr_str) == 1) attr_str = rep(attr_str, length(tokens))
  ifelse(attr_str == '',
         yes = as.character(tokens), ## if a tokens has no attributes, do not add a span tag.
         no = add_tag(as.character(tokens), tag, attr_str))
}

#' Highlight tokens
#'
#' This is a convenience wrapper for tag_tokens() that can be used if tokens only need to be colored.
#'
#' @param tokens    A character vector of tokens
#' @param value     Either a logical vector or a numeric vector with values between 0 and 1.
#'                  If a logical vector is used, then tokens with TRUE will be highlighted (with the color specified in pos_col).
#'                  If a numeric vector is used, the value determines the alpha (transparency), with 0 being fully transparent
#'                  and 1 being fully colored.
#' @param col       The color used to highlight
#'
#' @return a character vector of color-tagged tokens
#' @export
#'
#' @examples
#' highlight_tokens(c('token_1','token_2','token_3'),
#'                  value = c(FALSE,FALSE,TRUE))
#'
#' highlight_tokens(c('token_1','token_2','token_3'),
#'                  value = c(0,0.3,0.6))
highlight_tokens <- function(tokens, value, col='yellow') {
  col = highlight_col(value, col=col)
  tag_tokens(tokens,
             style = attr_style(`background-color` = col))
}

#' Color tokens using colorRamp
#'
#' This is a convenience wrapper for tag_tokens() that can be used if tokens only need to be colored.
#'
#' @param tokens     A character vector of tokens
#' @param value      A numeric vector with values between -1 and 1. Determines the color mixture of the scale colors
#'                   specified in col_range
#' @param alpha      Optionally, the alpha (transparency) can be specified, with 0 being fully transparent and 1 being
#'                   fully colored. This can be a vector to specify a different alpha for each value.
#' @param col_range  The colors used in the scale ramp.
#'
#' @return a character vector of color-tagged tokens
#' @export
#'
#' @examples
#' colorscale_tokens(c('token_1','token_2','token_3'),
#'                  value = c(-1,0,1))
colorscale_tokens <- function(tokens, value, alpha=0.4, col_range=c('red', 'blue')) {
  col = scale_col(value, alpha=alpha, col_range = col_range)

  tag_tokens(tokens,
             style = attr_style(`background-color` = col))
}

#' Highlight tokens per category
#'
#' This is a convenience wrapper for tag_tokens() that can be used if tokens need to be colored per category
#'
#' @param tokens    A character vector of tokens
#' @param category  A numeric vector with values representing category indices.
#' @param alpha      Optionally, the alpha (transparency) can be specified, with 0 being fully transparent and 1 being
#'                   fully colored. This can be a vector to specify a different alpha for each value.
#' @param colors    A character vector with color names for unique values of the value argument. Has to be the same length
#'                  as unique(na.omit(category))
#' @param ...       Extra arguments to be passed to tag_tokens (e.g. title)
#'
#' @return a character vector of color-tagged tokens
#' @export
category_highlight_tokens <- function(tokens, category, alpha=0.4, colors=NULL, ...) {
  ncategories = length(unique(stats::na.omit(category)))
  if (is.null(colors)) colors = grDevices::rainbow(ncategories)
  if (!length(colors) == ncategories) stop(sprintf('The number of colors (%s) is not equal to the number of cateories (%s)', length(colors), ncategories))

  if (length(alpha) == 1) alpha = rep(alpha, length(category))
  tcolor = colors[category]
  alpha[is.na(tcolor)] = NA

  col = highlight_col(alpha, col=tcolor)

  tag_tokens(tokens,
             style = attr_style(`background-color` = col), ...)
}
