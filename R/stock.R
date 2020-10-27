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
  stock_data <- quantmod::getSymbols(stock_code, src="yahoo", auto.assign = FALSE) %>%
    as.data.frame() %>%
    dplyr::rename_with(
      function(x) gsub(paste0(stock_code,"."), "", x=x)
    ) %>%
    tibble::rownames_to_column("Date")

  stock_data
}

#' Return monthly variation of a asset
#'
#' Given a `stock_data` data.frame, increment data with a `Variation`.
#'
#' @param stock_data data.frame
#'
#' @import dplyr
#'
#' @return data.frame
#'
#' @export
#'
#' @examples
#' raw_stock = stock("VALE3.SA")
#' add_monthly_variation(raw_stock, '2019-10-26')
add_monthly_variation <- function(stock_data, start_date) {
  stock_data %>%
    mutate(Month = lubridate::floor_date(as.Date(Date), "month")) %>%
    group_by(Month) %>%
    mutate(rank = rank(Date)) %>%
    filter(rank == 1) %>%
    ungroup(Month) %>%
    mutate(Variation = (Close - lag(Close)) / lag(Close)) %>%
    filter(Date >= start_date) %>%
    select(Month, Close, Variation)
}
