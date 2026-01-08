'''You are asked to
1. Build classification model with h2o.automl();
2. Apply Cross-validation;
3. Find threshold by max F1 score;
4. Calculate Accuracy, AUC, GİNİ.

Complete Homework with following steps:
1. Name your final homework Script as (Mushroom Classification Model)
2. Create repository named “Mushroom-Classification-Model” in your Github account and push your
homework Script to this repository.
3. Fork other users’ repositories, make pull requests (at least one, making three pull requests is desirable).'''
library(tidyverse)
library(data.table)
library(rstudioapi)
library(skimr)
library(car)
library(h2o)
library(rlang)
library(glue)
library(highcharter)
library(lime)

view(mushrooms)
df <- mushrooms %>% view()

df <- df[, sapply(df, function(x) length(unique(x)) > 1)]
df[] <- lapply(df, as.factor)
df[] <- lapply(df, function(x) {
  if (is.factor(x)) as.factor(as.numeric(x)) else x
})
str(df)
view(df)

df$class <- df$class %>% recode("2=0 ") %>% as_factor()

h2o.init()

h2o_data <- df %>% as.h2o()

h2o_data <- h2o_data %>% h2o.splitFrame(ratios = 0.8, seed = 123)
train <- h2o_data[[1]]
test <- h2o_data[[2]]

target <- 'class'
features <- df %>% select(-class) %>% names()


# Fitting h2o model ----
model <- h2o.automl(
  x = features, y = target,
  training_frame = train,
  validation_frame = test,
  leaderboard_frame = test,
  stopping_metric = "AUC",
  nfolds = 10, seed = 123,
  max_runtime_secs = 20)

model@leaderboard %>% as.data.frame()
model@leader 



