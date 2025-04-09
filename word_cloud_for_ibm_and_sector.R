#Install load tm package
install.packages("tm")
library(tm)

#Get the data from text file 
#text <- readLines("Perspectives.txt")
text <- read.csv("preprocessed_it_sector.csv")[9]
text

#Creating and inspecting Corpus
docs <- Corpus(VectorSource(text))
inspect(docs)

#Cleaning Dataset
docs <- tm_map(docs, tolower)
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removeWords, stopwords("en"))
docs <- tm_map(docs, removeWords, c("forecasts")) #to remove selected words manually
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, stripWhitespace)

#Inspecting docs
inspect(docs)

#create the document term matrix
dtm <- TermDocumentMatrix(docs)
inspect(dtm)
str(dtm)
mat <- as.matrix(dtm)
View(mat)
v <- sort(rowSums(mat),decreasing=TRUE)
View(v)

#Creating a Data frame
data <- data.frame(word = names(v),freq=v)
rownames(data) <- NULL
View(data)

#Installing and loading required packages
install.packages("wordcloud")
library(wordcloud)
install.packages("RColorBrewer")
library(RColorBrewer)

#generate the wordcloud
wordcloud(words = data$word, freq = data$freq, min.freq = 2,
          max.words=100, scale= c(3,1), random.order=FALSE, rot.per=0.50,
          colors=brewer.pal(8, "Set2"))

#Installing and loading wordcloud2 package
install.packages("wordcloud2")
library(wordcloud2)

#Plotting wordcloud
wordcloud2(data=data, size = 0.5, background= "white")
