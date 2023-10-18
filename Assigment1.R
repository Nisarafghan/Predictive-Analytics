
myData <- data.frame(
  person = c("stan", "francine", "steve", "roger", "Hayley", "Klaus"), 
  sex = factor(c("M","F","M","M","F","M")),
  funny = factor(c("High","Med","Low", "High","Med","Med")))
myData$person



age <- c(40, 40,15,1600,21,60)

myData <- cbind(myData, age)

myData <- df %>% distinct(myData)
