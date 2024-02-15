# This is to simulate my data similar to what I would find in the 
# paper I am replicating

library(tidyverse)


set.seed(456)

# Simulate the table of rps questions selecting what I am interested in
simulated_rps_data <- tibble(
  Person = c(1:20),
  Year = rep(2020, 20),
  Month = rep(5, 20),
  feb_employment = round(runif(20, 0, 1), 0),
  feb_day_worked = round(runif(20, 0, 7), 0),
  feb_day_comm = round(runif(20, 0, 7), 0),
  may_employment = round(runif(20, 0, 1), 0),
  may_day_worked = round(runif(20, 0, 7), 0),
  may_day_comm = round(runif(20, 0, 7), 0),
)


# simulate a graph of this data
simulated_rps_data |>
  summarise(
    mean_feb_work = mean(feb_day_worked),
    mean_may_work = mean(may_day_worked),
    avg_feb_comm = mean(feb_day_comm),
    )
