library(shiny)
if(!require(ECharts2Shiny))
  install.packages("ECharts2Shiny")
library(ECharts2Shiny)

sample_data_for_wordcloud <- data.frame(name = c("Asia", "Africa", "North America", "South America",
                                                 "Antarctica", "Europe", "Australia"),
                                        value = c(44391162, 30244049, 24247039, 17821029, 14245000,
                                                  10354636, 7686884))

# Server function -------------------------------------------
server <- function(input, output) {
  renderWordcloud("test", data =sample_data_for_wordcloud)
}

# UI layout -------------------------------------------------
ui <- fluidPage(
  # We MUST load the ECharts javascript library in advance
  loadEChartsLibrary(),
  tags$div(id="test", style="width:100%;height:500px;"),
  deliverChart(div_id = "test")
)

# Run the application --------------------------------------
shinyApp(ui = ui, server = server)