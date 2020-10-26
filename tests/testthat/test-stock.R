test_that("stock() returns historical price data", {
  stock_code <- c("VALE3.SA")
  expected_columns <- c("Date", "Open", "High", "Low",
                        "Close", "Volume", "Adjusted")

  vale3 <- stock(stock_code)

  expect(nrow(vale3) > 0, "stock() unexpectedly returned 0 rows.")
  expect_equal(names(vale3), expected_columns)
})
