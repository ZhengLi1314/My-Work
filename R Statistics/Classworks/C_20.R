rm(list=ls())
sentence <- "Hello my friend"

PigLatin <- function(sentence){
  myList <- strsplit(sentence," ")
  num <- c(1:length(myList[[1]]))
  translation<-list()
  for (i in num){
    char <- strsplit(myList[[1]][i], "")
    temp <- char[[1]][1]
    char2 <- char[[1]][-1]
    char2[length(char2)+1] <- temp
    char2[length(char2)+1] <- 'ay'
    x <- unlist(char2)
    string <- paste(x,collapse="")
    translation[i] <- string
  }
  
  return (paste(unlist(translation),collapse=" "))
}

print(PigLatin(sentence))




"""
myList <- strsplit(sentence," ")
num <- c(1:length(myList[[1]]))
char <- strsplit(myList[[1]][1], "")
temp <- char[[1]][1]
char2 <- char[[1]][-1]
print(length(char2))
char2[5] <- temp
char2[length(char2)+1] <- 'ay'
x <- unlist(char2)
paste(x,collapse="")
"""

