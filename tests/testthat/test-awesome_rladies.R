test_that("assess awesome rladies", {
  # writing a single message
  expected_1 <- write_rladies(1)
  expected_2 <- write_rladies(2)

  expect_type(expected_1, "character")
  expect_equal(expected_1, "There is 1 awesome RLady!")
  expect_equal(expected_2, "There are 2 awesome RLadies!")

  # writing multiple message
  expected_multiple <- compose_rladies(1:2)
  expect_length(expected_multiple, 2)
  # catching error
  expect_error(compose_rladies("a"))
  expect_error(compose_rladies("-1"))
  expect_error(compose_rladies("one"))
  expect_error(compose_rladies(1.4))
})
