pollutantmean <- function(directory, pollutant, id = 1:332) {
  directory = dirname(directory)
  csvs <- character(length=0)
  for(i in id) {

    csvs <- c(csvs, dir(path=directory, pattern = sprintf("%03d.csv", i, full.names = TRUE)))


  }
  #csvs <- dir(path=directory, pattern = sprintf("%03d.csv", id), full.names = TRUE)
  #print(csvs)
  ldf <- data.frame(x = numeric(), y = character(), stringsAsFactors = FALSE)
  for(i in 1:length(csvs)){
    ldf <- rbind(ldf, data.frame(read.csv(csvs[i])))
  print(csvs[i])}
  #print(ldf)
  if(pollutant == "nitrate") {
  meana <- mean(ldf$nitrate, na.rm = TRUE)
  } else if(pollutant == "sulfate") {
  meana <- mean(ldf$sulfate, na.rm = TRUE)
  }
  options(digits = 4)
  print(meana)
}
