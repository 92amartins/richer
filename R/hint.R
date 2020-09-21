#' Hint action for a stock
#'
#' Suggests a action (buy, hold or sell) for a specific stock.
#'
#' @param stock_code character
#'
#' @return character
#'
#' @export
#'
#' @examples
#' hint("VALE3.SA")
hint <- function(stock_code) {
  sample(c("buy", "hold", "sell"), 1)
}