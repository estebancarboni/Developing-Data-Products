fluidPage(
    titlePanel("California Test Scores by County (1998-1999)"),
    fluidRow(
        column(width = 4,
               plotOutput("plot1", 
                          height = 300,
                          click = "plot1_click",
                          brush = brushOpts(
                              id = "plot1_brush"
                          )
               )
        )
    ),
    
    fluidRow(
        column(width = 6,
               h4("Points near click"),
               verbatimTextOutput("click_info")
        ),
        column(width = 6,
               h4("Brushed points"),
               verbatimTextOutput("brush_info")
        )
    )
)