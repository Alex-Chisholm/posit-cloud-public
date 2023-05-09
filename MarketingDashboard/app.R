library(shiny)
library(ggplot2)

ui <- fluidPage(
  
  titlePanel("Website Engagement"),
  
  sidebarLayout(
    sidebarPanel(
      
      radioButtons("rb", "Select Website:",
                   choices = list("New website", "Old website"
                   )),
      sliderInput("bins",
                  "Select number of data bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    set.seed(123)
    new <- rnorm(1000, 240, 40)
    old <- rnorm(1000, 150, 50)
    if(input$rb == 'New website') {
      
      chart_data =  new }
     else {
      chart_data = old 
    }
    

    ggplot(data.frame(values = chart_data), aes(x = values)) + 
      geom_histogram(fill = 'blue', color = "black", bins = input$bins) +
      theme_minimal() +
      labs(title = paste0("Mean time on the ", input$rb, ": " , round(mean(chart_data),0), " seconds"))

    # hist(chart_data, breaks = bins, col = 'lightblue', border = 'white',
    #      xlab = 'Seconds on the website',
    #      main = 'Visitor distribution')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
