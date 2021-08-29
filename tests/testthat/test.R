test_that("encode", {

  speciesNameEn <- 'silver fir';
  treeSpeciesIdEn <- encode(speciesNameEn, 'en')

  expect_type( treeSpeciesIdEn, "character")
  expect_equal( treeSpeciesIdEn, "cDD")



  speciesNameEs <- decode(treeSpeciesIdEn, 'es')
  expect_type( speciesNameEs[1], "character")

  treeSpeciesIdEs <- encode(speciesNameEs[1], 'es')


  expect_type( treeSpeciesIdEs, "character")
  expect_equal( treeSpeciesIdEs, "cDD")


  expect_true(treeSpeciesIdEn == treeSpeciesIdEs)
})

test_that("list", {

  treeSpeciesIdEn <- getSpeciesLength('en')

  expect_type( treeSpeciesIdEn, "integer")
})

test_that("color", {

  color <- getColorFromId('cDD')

  expect_type( color, "character")
})
