library(shiny, warn.conflicts = FALSE)
library(miniUI)
library(rsconnect)

data <- read.csv("https://github.com/estebancarboni/Developing-Data-Products/blob/master/data.csv?raw=true")
data <- data[, c(2, 8, 11, 12)]
shinyServer(function(input, output, session) {

    output$plot <- renderPlot({
        plot(data$avginc, 
             data$testscr, 
             main = "Test score / Avg income",
             xlab = "Avg income",
             ylab = "Test score")
    })
    
    observeEvent(input$done, {
        stopApp(brushedPoints(data, 
                              input$brush,
                              xvar = "avginc", 
                              yvar = "testscr"))
    })

})
