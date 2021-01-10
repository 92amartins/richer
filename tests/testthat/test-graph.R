test_that("graph() returns a graph", {
  stock_code <- "PETR4.SA"
  g <- graph(stock_code, "2020-01-01")

  expect(nrow(g$data) > 0, "no data available. check stock() call.")
  expect(g$labels$title == "PETR4.SA variation", "malformed title.")
  expect(g$labels$x == "Month", "malformed x-axis.")
  expect(g$labels$y == "Variation", "malformed y-axis")
})

test_that("weekly_graph() returns a weekly graph", {
  stock_code <- "PETR4.SA"
  g <- weekly_graph(stock_code, "2020-01-01")

  expect(nrow(g$data) > 0, "no data available. check stock() call.")
  expect(g$labels$title == "PETR4.SA weekly variation", "malformed title.")
  expect(g$labels$x == "Date", "malformed x-axis.")
  expect(g$labels$y == "Variation", "malformed y-axis")
})
