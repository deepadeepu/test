##install.packages("pdftools")
##library(pdftools)
library(tm)
library(wordcloud)
data<-read.csv("pubmed_result.csv")
library(stringr)
str_split_fixed(data$ShortDetails, ".", 2)
View(data)
head(data)
docs=as.character(data$ShortDetails)
docs=VCorpus(VectorSource(docs))
docs

dtm= DocumentTermMatrix(docs)
df_dtm=as.data.frame(as.matrix(dtm))
x=colSums(df_dtm)
words_freq=data.frame(words=labels(x),freq=x)#naming columns
x[1:5]
#View(words_freq)
library(dplyr)
words_freq %>% arrange(-freq)%>% head(50)
#########word cloud
library(RColorBrewer)
wordcloud(words_freq$words,words_freq$freq,min.freq = 30,random.order = F,random.color = T,
          colors =brewer.pal(name='Dark2',12) )


