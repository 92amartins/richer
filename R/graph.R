#' Display a graph of an asset variation overtime
#'
#' @param stock_code character
#' @param start_date character
#'
#' @return NA
#'
#' @import ggplot2
#' @import scales
#'
#' @export
#'
#' @examples
#' graph("VALE3.SA", "2019-10-31")
graph <- function(stock_code, start_date) {
  asset <- stock(stock_code) %>% add_monthly_variation(start_date) %>% mutate(Date = as.Date(Month))

  ggplot(asset, aes(Month, Variation)) +
    geom_bar(position=position_dodge(), stat='identity') +
    geom_text(aes(label = sprintf("%0.2f", round(Variation, digits = 2))), size = 4, vjust = 1.2) +
    labs(
      title = paste(stock_code, "variation")
    ) +
    scale_x_date(labels = date_format("%b-%Y"), date_breaks = "1 month")
}
