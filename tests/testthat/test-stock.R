test_that("stock() returns historical price data", {
  stock_code <- c("VALE3.SA")
  expected_columns <- c("VALE3.SA.Open", "VALE3.SA.High", "VALE3.SA.Low",
                        "VALE3.SA.Close", "VALE3.SA.Volume", "VALE3.SA.Adjusted")

  vale3 <- stock(stock_code)

  expect(nrow(vale3) > 0, "stock() unexpectedly returned 0 rows.")
  expect_equal(names(vale3), expected_columns)
})
