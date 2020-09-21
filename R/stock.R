#' Return stock data
#'
#' Given a `stock_code`, return its price history from Yahoo Finance.
#'
#' @param stock_code character
#'
#' @return data.frame
#'
#' @export
#'
#' @examples
#' stock("VALE3.SA")
stock <- function(stock_code) {
  stock_data <- quantmod::getSymbols(stock_code, src="yahoo", auto.assign = FALSE)
  as.data.frame(stock_data)
}