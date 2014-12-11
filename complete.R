complete <- function(directory, id = 1:332) {
  #in order to use this function, the working directory must be where de "*.csv"'s are.
  directory = dirname(directory)
  class(directory)
  csvs <- character(length=0)
  for(i in id) {
    csvs <- c(csvs, dir(path=directory, pattern = sprintf("%03d.csv", i, full.names = TRUE)))
  }
  nobs <- c()
  for(i in 1:length(csvs)){
    nobs[i] <- sum(complete.cases(read.csv(csvs[i])))
    ####print(nobs)
    ###ldf <- rbind(ldf,data.frame(read.csv(csvs[i])))
    ###print(csvs[i])}
  }
  data <- data.frame(id, nobs)
  
  data
}
