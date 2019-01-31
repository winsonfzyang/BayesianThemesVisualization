function(input, output, session) {
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    
      # withProgress({
        setProgress(message = "Processing corpus...")
        file <- input$selection$datapath

        getTermMatrix(file)
        
      # }) #withProgress

  }) #reactive
  
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    if (is.null(input$selection))
      return(NULL)
    
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(4,0.5),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
}