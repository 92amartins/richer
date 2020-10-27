test_that("stock() returns historical price data", {
  stock_code <- c("VALE3.SA")
  expected_columns <- c("Date", "Open", "High", "Low",
                        "Close", "Volume", "Adjusted")

  vale3 <- stock(stock_code)

  expect(nrow(vale3) > 0, "stock() unexpectedly returned 0 rows.")
  expect_equal(names(vale3), expected_columns)
})

test_that("add_monthly_variation() adds variation column", {
  stock_code <- c("VALE3.SA")
  expected_columns <- c("Month", "Close", "Variation")

  raw_vale3 <- stock(stock_code)
  vale3 <- add_monthly_variation(raw_vale3, "2019-10-26")


  expect(nrow(vale3) > 0, "add_monthly() unexpectedly returned 0 rows.")
  expect_equal(names(vale3), expected_columns)
})
