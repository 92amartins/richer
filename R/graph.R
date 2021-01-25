#' Display a graph of an asset variation over months
#'
#' @param stock_code character
#' @param start_date character
#'
#' @return ggplot object
#'
#' @import ggplot2
#' @import scales
#'
#' @export
#'
#' @examples
#' graph("VALE3.SA", "2019-10-31")
graph <- function(stock_code, start_date) {
  asset <- stock(stock_code) %>%
      add_monthly_variation(start_date) %>%
      mutate(Date = as.Date(Month)) %>%
      mutate(Sign = as.character(sign(Variation)))

  ggplot(asset, aes(Month, Variation, color=Sign, fill=Sign)) +
    geom_bar(position=position_dodge(), stat='identity') +
    geom_text(aes(label = sprintf("%0.2f", round(Variation, digits = 2))), color="white", size = 4, vjust = 1.2) +
    labs(
      title = stock_code,
      subtitle = "Monthly Variation",
      caption = "Source: Yahoo Finance (powered by quantmod)."
    ) +
    theme_dark() +
    theme(legend.position = "none") +
    scale_x_date(labels = date_format("%b-%Y"), date_breaks = "1 month")
}


#' Display a graph of an asset variation over weeks
#'
#' @param stock_code character
#' @param start_date character
#'
#' @return ggplot object
#'
#' @import ggplot2
#'
#' @export
#'
#' @examples
#' weekly_graph("VALE3.SA", "2019-10-31")
weekly_graph <- function(stock_code, start_date) {
  asset <- stock(stock_code) %>%
    add_weekly_variation(start_date) %>%
    mutate(Week = as.Date(Date)) %>%
    mutate(Sign = as.character(sign(Variation)))

  ggplot(asset, aes(Week, Variation, color=Sign, fill=Sign)) +
    geom_bar(position=position_dodge(), stat='identity') +
    geom_text(aes(label = sprintf("%0.2f", round(Variation, digits = 2))), color="white", size = 4, vjust = 1.2) +
    labs(
      title = stock_code,
      subtitle = "Weekly Variation",
      caption = "Source: Yahoo Finance (powered by quantmod)."
    ) +
    theme_dark() +
    theme(legend.position = "none") +
    scale_x_date(labels = date_format("%U-%Y"), date_breaks = "7 days")
}
