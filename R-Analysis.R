library("readxl")
library(car)
library(hydroTSM)
library(sjPlot)

my_data <- read_excel("CECpond.xlsx")

colnames(my_data)[c(5,6,7)] = c('AvgVSS', 'AvgTAN', 'AvgMinDO')

my_data$Month <- format(as.Date(my_data$Month, format="%d/%m/%Y"),"%m")

my_data$Month = as.factor(my_data$Month)

my_data$AvgHRT = as.factor(my_data$AvgHRT)

model <- lm(AvgTAN ~ Month + AvgHRT + AvgVSS + AvgMinDO + AvgpH, data=my_data)

plot_model(model, type = "pred", terms = c("AvgVSS", "AvgHRT", "AvgMinDO", "AvgpH"))