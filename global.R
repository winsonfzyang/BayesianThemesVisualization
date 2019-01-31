# Install pacman if not 
if(!(require(pacman)))
  install.packages("pacman")

library(pacman)
p_load("shiny","tm","wordcloud","memoise")




# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(book) {
  
  text <- readLines(book)
  
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords, c(stopwords("SMART")))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})