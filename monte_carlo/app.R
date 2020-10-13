library(shiny)
library(tidyverse)

source("montecarlo.R")

ui <- fluidPage(

    titlePanel("Monte Carlo Simulation"),

    sidebarLayout(
        sidebarPanel(
            sliderInput(
                "return",
                label = "Expected Return:",
                min = 0.0,
                max = 1.0,
                value = 0.25
            ),
            sliderInput(
                "sd",
                label = "Standard Deviation:",
                min = 0.0,
                max = 1.0,
                value = 0.20
            ),
            sliderInput(
                "period",
                label = "Period",
                min = 1,
                max = 300,
                value=256
            ),
            sliderInput(
                "sims",
                label = "Simulations:",
                min = 1,
                max = 10000,
                value=1000
            ),
            numericInput(
                "initial_price",
                "Initial Price:",
                value = 10
            ),
        ),

        mainPanel(
           plotOutput("simPlot"),
           tableOutput("quantiles")
        )
    )
)

server <- function(input, output) {

    output$simPlot <- renderPlot({
        simulated_data <- run_montecarlo(
            input$period, input$sims, input$initial_price,
            input$return, input$sd
        )

        plot_data <- simulated_data %>%
            as.data.frame() %>%
            gather(key="sim") %>%
            group_by(sim) %>%
            mutate(time=row_number()) %>%
            ungroup()

        plot_data %>%
            ggplot() +
            geom_line(aes(time,value, color=sim)) +
            theme(
                legend.position = "none"
            ) +
            labs(
                title = "Simulacao de Monte Carlo - Outspoken Market",
                x="Time",
                y="Price"
            ) +
            annotate("text", x = 0, y = 25,
                     label = paste("5%:", round(quantile(plot_data$value, probs=0.05), 2))
            ) +
            annotate("text", x = 0, y = 23,
                     label = paste("95%:", round(quantile(plot_data$value, probs=0.95), 2))
            ) +
            annotate("text", x = 2, y = 20,
                     label = paste("VaR (1%):", round((1-input$initial_price/quantile(plot_data$value,probs=0.01))*100,2))
            ) +
            annotate("text", x = 2, y = 18,
                     label = paste("VaR (5%):", round((1-input$initial_price/quantile(plot_data$value,probs=0.05))*100,2))
            )

    })
}

shinyApp(ui = ui, server = server)
