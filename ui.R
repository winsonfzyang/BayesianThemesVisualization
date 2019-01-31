fluidPage(
  # Application title
  titlePanel("Word Cloud"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      # selectInput("selection", "Choose a book:",
      #             choices = books),
      fileInput("selection", "Select your text file",
                multiple = FALSE, accept = c("txt")),
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 100)
    ),
    
    # Show Word Cloud
    mainPanel(
      plotOutput("plot")
      # verbatimTextOutput("selected_var")
    )
  )
)