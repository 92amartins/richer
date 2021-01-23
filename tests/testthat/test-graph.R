test_that("graph() returns a graph", {
  stock_code <- "PETR4.SA"
  g <- graph(stock_code, "2020-01-01")

  expect(nrow(g$data) > 0, "no data available. check stock() call.")
  expect(g$labels$title == "PETR4.SA", "malformed title.")
  expect(g$labels$subtitle == "Monthly Variation", "malformed subtitle.")
  expect(g$labels$caption == "Source: Yahoo Finance (powered by quantmod).", "malformed caption.")
  expect(g$labels$x == "Month", "malformed x-axis.")
  expect(g$labels$y == "Variation", "malformed y-axis")
})

test_that("weekly_graph() returns a weekly graph", {
  stock_code <- "PETR4.SA"
  g <- weekly_graph(stock_code, "2020-01-01")

  expect(nrow(g$data) > 0, "no data available. check stock() call.")
  expect(g$labels$title == "PETR4.SA", "malformed title.")
  expect(g$labels$subtitle == "Weekly Variation", "malformed subtitle.")
  expect(g$labels$caption == "Source: Yahoo Finance (powered by quantmod).", "malformed caption.")
  expect(g$labels$x == "Week", "malformed x-axis.")
  expect(g$labels$y == "Variation", "malformed y-axis")
})
