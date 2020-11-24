data <- read.csv("https://github.com/estebancarboni/Developing-Data-Products/blob/master/data.csv?raw=true")
data <- data[, c(2, 8, 11, 12)]
data$avginc <- data$avginc*1000

library(ggplot2)

function(input, output) {
    output$plot1 <- renderPlot({
        ggplot(data, aes(avginc, testscr)) + 
            geom_point(aes(color = -avginc)) +
            theme_classic() +
            labs(title = "Brush and see the points below",
                 subtitle = "Or click near a point instead",
                 x = "Average Income (USD)",
                 y = "Average Test Scores")
    })
    
    output$click_info <- renderPrint({
        nearPoints(data, 
                   input$plot1_click, 
                   addDist = TRUE)
    })
    
    output$brush_info <- renderPrint({
        brushedPoints(data, 
                      input$plot1_brush)
    })
}
