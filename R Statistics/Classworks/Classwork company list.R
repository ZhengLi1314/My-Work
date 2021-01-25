companylist <- read.csv(file = 'Company_list.csv')
maxasset <- max(companylist["at"])
complist <- companylist["at"]
index<-0
for (i in (1:length(companylist["at"]))){
  if(complist[i] == maxasset){
    index <- i
  }
}
index