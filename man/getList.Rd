% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tree-species.R
\name{getList}
\alias{getList}
\title{All species in defined language}
\usage{
getList(languageCode)
}
\arguments{
\item{languageCode}{Language code ("de", "en", "es")}
}
\value{
Data frame from all species & ids in defined language
}
\description{
Returns a 3 character species id from a given species name.
}
\examples{
getList("en")
getList("de")
getList("es")
}
