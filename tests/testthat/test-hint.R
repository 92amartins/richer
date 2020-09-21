test_that("hint() returns a random hint", {
  stock_code <- c("VALE3")
  possible_hints <- c("buy", "hold", "sell")
  
  expect(
    hint(stock_code) %in% possible_hints,
    failure_message = "hint() is not returning one of the possible hints"
  )
})
