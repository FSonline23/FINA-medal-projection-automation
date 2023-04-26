
library(conflicted)
library(tidyverse)
library(ggplot2)
library(readxl)
library(chron)
library(lubridate)

conflicts_prefer(dplyr::filter)

# Read_CSV On Desktop
filePath <- "F 200 Freestyle.xlsx"
swiming_data_2019to2023<- read_excel(filePath, sheet="Competitors 2019-2023")
swiming_data_2022to2023 <- read_excel(filePath, sheet="Competitors 2022-2023")
swiming_data_2023 <- read_excel(filePath, sheet="Competitors 2023")

# Filter Unqiue Swimmers, Loop through each swimmer and perform Shapiro Wilk's Test
UniqueSwimmers <- unique(swiming_data_2019to2023$full_name_computed)
for (i in 1:length(UniqueSwimmers)) {
  print(UniqueSwimmers[i])
  dataset_used = "2023"
  Swimmer <- filter(swiming_data_2023, full_name_computed == UniqueSwimmers[i])

  # Conditional Checks for Count of Dataframe Object. If less than 3, escalate to next dataset.
  if (nrow(Swimmer) < 3) {
    dataset_used = "2022-2023"
    Swimmer <- filter(swiming_data_2022to2023, full_name_computed == UniqueSwimmers[i])
  }

  if (nrow(Swimmer) < 3) {
    dataset_used = "2019-2023"
    Swimmer <- filter(swiming_data_2019to2023, full_name_computed == UniqueSwimmers[i])
  }

  Swimmer$swim_time <-period_to_seconds(ms(Swimmer$swim_time))
  shap_test = shapiro.test(Swimmer$swim_time)

  if (shap_test$p.value <  0.05) {
    dataset_used = "2022-2023"
    print("Shapiro-wilk test lesser than 0.05, trying 2022 to 2023 dataset")
    Swimmer <- filter(swiming_data_2022to2023, full_name_computed == UniqueSwimmers[i])
    Swimmer$swim_time <-period_to_seconds(ms(Swimmer$swim_time))
    shap_test = shapiro.test(Swimmer$swim_time)
    print(shap_test$p.value)
  }

  if (shap_test$p.value <  0.05) {
    dataset_used = "2019-2023"
    print("Shapiro-wilk test lesser than 0.05, trying 2019 to 2023 dataset")
    Swimmer <- filter(swiming_data_2019to2023, full_name_computed == UniqueSwimmers[i])
    Swimmer$swim_time <-period_to_seconds(ms(Swimmer$swim_time))
    shap_test = shapiro.test(Swimmer$swim_time)
    print(shap_test$p.value)

  }

  print(paste("Final Shapiro wilk p-value:", shap_test$p.value, ". Dataset Used:", dataset_used))

}
