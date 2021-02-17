#' Calculate beta index for a given asset in the last 12 months.
#'
#'
#' @param stock_code character
#'
#' @return character
#'
#' @import dplyr
#' @import lubridate
#' @importFrom stats cov var
#'
#' @export
#'
#' @examples
#' beta("VALE3.SA")
beta <- function(stock_code) {
  start_date = Sys.Date()
  month(start_date) = month(start_date) - 12

  a = (stock(stock_code) %>% add_monthly_variation(start_date))$Variation
  b = (stock("^BVSP") %>% add_monthly_variation(start_date))$Variation

  cov(a, b) / var(b)
}
