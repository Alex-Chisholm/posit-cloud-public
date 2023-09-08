library(readr)
library(dplyr)
library(ggplot2)

marketing <- read_csv("marketing.csv")

glimpse(marketing)

ggplot(marketing, aes(x = Income, y=  MntTotal)) + 
  geom_point(color = "orange", alpha = 0.4) +
  geom_smooth(se = FALSE ) +
  theme_minimal() +
  labs(title = "Homes with higher incomes tend to spend more on our products - copy")