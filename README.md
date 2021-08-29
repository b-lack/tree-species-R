# Tree Species Internationalization R

This package includes lists of tree species with corresponding translation. It is intended to support forest-specific applications to get ready for internationalization.

## Installation

The current development version can be installed from GitHub with

´´´
devtools::install_github("b-lack/tree-species-i18n-R")

´´´

## Usage

```R
library(TreeSpeciesI18N)

speciesCount <- TreeSpeciesI18N::getSpeciesLength('en')
print(paste('Availible Species ', speciesCount))

treeNameToSearch <- 'silver fir';
treeSpeciesId <- TreeSpeciesI18N::encode(treeNameToSearch, 'en')
print(paste('Species Id: ', treeSpeciesId))

# Search for species name by id and language code
treeName <- TreeSpeciesI18N::decode(treeSpeciesId, 'es')
print(paste('Spanish Tree Name: ', treeName))

# Get tree list by language code
speciesArrayDe <- TreeSpeciesI18N::getList('de')
print(paste('List of species (de): ', length(speciesArrayDe)))

# Get color by species id
speciesColor <- TreeSpeciesI18N::getColorFromId(treeSpeciesId);
print(paste('Color by Tree Species ID: ', treeSpeciesId, 'color: #', speciesColor))

# Get random tree species by language code
randomSpeciesId <- TreeSpeciesI18N::getRandomSpeciesId('en')
print(paste('Random species id (en): ', randomSpeciesId))
```

## Credits

The scientific names are taken from [GlobalTreeSearch](https://tools.bgci.org/global_tree_search.php).

Translations are automatically generated using the [Wikipedia API](https://www.mediawiki.org/wiki/API).
