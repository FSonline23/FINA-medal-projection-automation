
library(conflicted)
library(tidyverse)
library(ggplot2)
library(readxl)

conflicts_prefer(dplyr::filter)

# Read_CSV On Desktop
filePath <- "F 200 Freestyle.xlsx"
swimming_data <- read_excel(filePath, sheet="Competitors 2019-2023")
# print(swimming_data)

# Filter Unqiue Swimmers, Loop through each swimmer and perform Shapiro Wilk's Test
UniqueSwimmers <- unique(swimming_data$full_name_computed)
for (i in 1:length(UniqueSwimmers)) {
  Swimmer <- filter(swimming_data, full_name_computed == UniqueSwimmers[i])
  Swimmer$swim_time <-as.numeric(Swimmer$swim_time)
  print(UniqueSwimmers[i])
  print(shapiro.test(Swimmer$swim_time))
}

'
# Graph Plotting and Individual Swimmer Analysis
Swimmer <- filter(swimming_data, full_name_computed == "CREWS, Kaikea")
Swimmer$swim_time <-as.numeric(Swimmer$swim_time)  
shapiro.test(Swimmer$swim_time)


ggplot(Swimmer, aes(x=swim_time)) + geom_histogram()
qplot(sample = swim_time, data = Swimmer)
cat("Mean is:", mean(Swimmer$swim_time), "\n")
cat("Stdev is:", sd(Swimmer$swim_time), "\n")
cat("No of Observations:", length(Swimmer$swim_time))
plot(density(Swimmer$swim_time))
qqnorm(Swimmer$swim_time);qqline(Swimmer$swim_time, col = 2)
'
