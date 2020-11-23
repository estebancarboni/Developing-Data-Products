library(shiny)
library(miniUI)
library(rsconnect)

shinyUI(miniPage(
    gadgetTitleBar("California Test Scores (1998-1999)"),
    miniContentPanel(
        plotOutput("plot", 
                   height = "100%", 
                   brush = "brush"))))