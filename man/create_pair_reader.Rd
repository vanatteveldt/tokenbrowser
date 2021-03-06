% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tokenvis.r
\name{create_pair_reader}
\alias{create_pair_reader}
\title{Convert paired sets of tokens into side-by-side full texts in an HTML file}
\usage{
create_pair_reader(tokens, pair_ids, meta = NULL, doc_col = "doc_id",
  token_col = "token", filename = NULL, doc_width = 750, css_str = NULL)
}
\arguments{
\item{tokens}{A data.frame with a column for document ids (doc_col)
and a column for tokens (token_col)}

\item{pair_ids}{A data.frame in which the first 2 columns contain the document ids for pairs. (essentially an egde list)}

\item{meta}{A data.frame with a column for document_ids (doc_col). All other columns are added
to the reader as document meta}

\item{doc_col}{The name of the document id column}

\item{token_col}{The name of the token column}

\item{filename}{Name of the output file. Default is temp file}

\item{doc_width}{The width of the document text field}

\item{css_str}{A character string, to be directly added to the css style header}
}
\value{
The name of the file where the reader is saved. Can be opened conveniently from within R using browseUrl()
}
\description{
Convert paired sets of tokens into side-by-side full texts in an HTML file
}
