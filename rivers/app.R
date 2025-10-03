#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)

# Definicja interfejsu użytkownika (UI)
ui <- fluidPage(
  titlePanel("Długość największych rzek Ameryki Płn."),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "bins", 
        label = "Liczba przedziałów:", 
        min = 5, 
        max = 50, 
        value = 20
      )
    ),
    
    mainPanel(
      plotOutput(outputId = "histogram")
    )
  )
)

# Definicja serwera aplikacji (Server)
server <- function(input, output) {
  output$histogram <- renderPlot({
    ggplot(data = data.frame(rivers = rivers), aes(x = rivers)) +
      geom_histogram(
        bins = input$bins, 
        fill = "skyblue", 
        color = "black", 
        alpha = 0.7
      ) +
      labs(
        title = "Długość największych rzek Ameryki Płn.",
        x = "Długość rzeki (w milach)",
        y = "Częstość"
      ) +
      theme_minimal()
  })
}

# Uruchomienie aplikacji
shinyApp(ui = ui, server = server)
