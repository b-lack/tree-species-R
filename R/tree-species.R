getV8Context <- function (){
  ct <- V8::v8()
  ct$source("https://cdn.jsdelivr.net/npm/tree-species-i18n@1.0.6/dist/index.esm.js")
  ct
}

#' Encode
#'
#' Returns a 3 character species id from a given species name.
#'
#' @param name Name of the species
#' @param languageCode Language code ("de", "en", "es")
#' @return 3 character species id
#' @export
#' @examples
#' encode("guatemalan fir", "en")
#' encode("Amerikanische Kastanie", "de")
#' encode("cedro oaxqueño", "es")
encode <- function(name, languageCode){
  ct <- getV8Context();
  return (  ct$call("TreeSpecies.encode", name, languageCode) )
}

#' All species in defined language
#'
#' Returns a 3 character species id from a given species name.
#'
#' @param languageCode Language code ("de", "en", "es")
#' @return Data frame from all species & ids in defined language
#' @export
#' @examples
#' getList("en")
#' getList("de")
#' getList("es")
getList <- function(languageCode){
  ct <- getV8Context();
  isList <- (ct$call("TreeSpecies.getList", languageCode))
  df <- data.frame(data = matrix(unlist(isList),  nrow=length(isList), byrow=TRUE))
  names(df)[1] <- "speciesId"
  names(df)[2] <- "Name"
  return (df)
}

#' Decode
#'
#' Returns a list of names of the given id.
#' (Multiple names if there are multiple names for the tree species in the specified language.)
#'
#' @param speciesId Id of the species
#' @param languageCode Language code ("de", "en", "es")
#' @return Data frame from all species & ids in defined language
#' @export
#' @examples
#' decode("cDD", "en")
#' decode("cDD", "de")
#' decode("cDD", "es")
decode <- function(speciesId, languageCode){
  ct <- getV8Context();
  return (ct$call("TreeSpecies.decode", speciesId, languageCode))
}


#' Color from species id
#'
#' Returns a color code for given species id
#'
#' @param speciesId Id of the species
#' @return character: hexadecimal color
#' @export
#' @examples
#' getColorFromId("cDD")
getColorFromId <- function(speciesId){
  ct <- getV8Context();
  return (ct$call("TreeSpecies.getColorFromId", speciesId))
}

#' Species Length
#'
#' Number of tree species available in the specified language
#'
#' @param languageCode Language code ("de", "en", "es")
#' @return integer
#' @export
#' @examples
#' getColorFromId("cDD")
getSpeciesLength <- function(languageCode){
  ct <- getV8Context();
  return (ct$call("TreeSpecies.getSpeciesLength", languageCode))
}

#' Random species id
#'
#' Returns random generated species id
#'
#' @param languageCode Language code ("de", "en", "es")
#' @return 3 character species id
#' @export
#' @examples
#' getRandomSpeciesId("en")
#' getRandomSpeciesId("de")
#' getRandomSpeciesId("es")
getRandomSpeciesId <- function(languageCode){
  ct <- getV8Context();
  return (ct$call("TreeSpecies.getRandomSpeciesId", languageCode))
}
