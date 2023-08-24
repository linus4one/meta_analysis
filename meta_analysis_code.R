#install meta package#

install.packages("meta")
library("meta")

#load csv
library(readr)
data <- read_csv("data.csv")


#meta-analysis object
meta_obj <- metaprop(
  event = data$event,
  n = data$total,
  data = data
)

#Identify study labels
Study <- data$Study

# Summary statistics
summary(meta_obj)



# Forest plot without labels
forest(meta_obj)

#forest pplot with labels
forest(meta_obj,
       leftcols = c("Study", "event", "total"),
       rightcols = c("effect", "ci"),
       squaresize = 0.5)

#funnel plot
funnel(meta_obj)
