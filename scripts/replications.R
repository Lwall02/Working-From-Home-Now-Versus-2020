# I attempt to replicate three graphs from "Work from Home Before and After the COVID-19 Outbreak"
# First I replicate Table 1 on page 5

library(tidyverse)
library(knitr)

view(rps_data_release_v3)


rps_data_may <- rps_data_release_v3 |>
  filter(month == 5, year == 2020) |>
#  filter(emp_simple_refweek == 1) |>
  select(pid, year, month, week, emp_simple_refweek, days_working_refweek, days_working_refweek,
         days_commuting_refweek, days_working_feb2020, days_commuting_feb2020, emp_simple_feb2020)


view(rps_data_may)

count_days_worked_may <- rps_data_may |>
  count(emp_simple_refweek)

employment_rate_may <- count_days_worked_may$n[3] / 4941

count_days_worked_feb <- rps_data_may |>
  count(emp_simple_feb2020)

employment_rate_feb <- count_days_worked_feb$n[3] / 4941

rps_data_may |>
  count(days_working_refweek)

rps_data_may |>
  count(days_working_feb2020)

avg_days_worked_may <- mean(rps_data_may$days_working_refweek[rps_data_may$days_working_refweek > 0])

avg_days_worked_feb <- mean(rps_data_may$days_working_feb2020[rps_data_may$days_working_feb2020 > 0])

# Add a column for fraction of workdays commuting
rps_data_with_fractions <- rps_data_may |> 
  filter(days_working_refweek >= 0, days_working_feb2020 >= 0) |>
  mutate(
    frac_days_comm_may = days_commuting_refweek / days_working_refweek,
    frac_days_comm_feb = days_commuting_feb2020 / days_working_feb2020
  )
view(rps_data_with_fractions)

avg_frac_may <- mean(rps_data_with_fractions$frac_days_comm_may)  

avg_frac_feb <- mean(rps_data_with_fractions$frac_days_comm_feb)  


100 * log(employment_rate_may / employment_rate_feb )

table_rep1 <- tibble(
  "February" = c(employment_rate_feb * 100, round(avg_days_worked_feb, 1), avg_frac_feb * 100),
  "May" = c(employment_rate_may * 100, round(avg_days_worked_may, 1), avg_frac_may * 100),
  "Change in Log Points" = c(
    100 * log(employment_rate_may / employment_rate_feb ),
    100 * log(avg_days_worked_may / avg_days_worked_feb ),
    100 * log(avg_frac_may / avg_frac_feb )
  )
) 

df_rep1 <- data.frame(
  "February" = round(c(employment_rate_feb * 100, round(avg_days_worked_feb, 1), avg_frac_feb * 100), 1),
  "May" = round(c(employment_rate_may * 100, round(avg_days_worked_may, 1), avg_frac_may * 100), 1),
  "Change_in_Log_Points" = c(
    round(100 * log(employment_rate_may / employment_rate_feb), 1),
    round(100 * log(avg_days_worked_may / avg_days_worked_feb), 1),
    round(100 * log(avg_frac_may / avg_frac_feb), 1)
  )
) 


total_log_points <- 100 * log(employment_rate_may / employment_rate_feb) + 
  100 * log(avg_days_worked_may / avg_days_worked_feb) +
  100 * log(avg_frac_may / avg_frac_feb)

df_rep1 <- df_rep1 |>
  add_row(February = as.integer(""), May = as.integer(""), 
          Change_in_Log_Points = round(total_log_points, 1))
  

rownames(df_rep1) <- c("Employment Rate (%)", 
                       "Avg. Daysorked Per Week", 
                       "Fractions of Workdays Commuting (%)",
                       "Log Points Change in Weekly Commuting Trips:")

df_rep1
 # END OF REPLICATION OF GRAPH 1


rps_data_release_v3 |>
  filter(month == 5, year == 2020) |>
  count(emp_detail_refweek)

rps_data_with_fractions |>
  count(frac_days_comm_feb) |>
  mutate(sum = sum(n))

rps_data_with_fractions |>
  count(frac_days_comm_may) |>
  mutate(sum = sum(n))

rps_data_may |> 
#  filter(days_working_refweek >= 0, days_working_feb2020 >= 0) |>
  filter(emp_simple_feb2020 > 0) |>
  mutate(
    frac_days_comm_may = days_commuting_refweek / days_working_refweek,
    frac_days_comm_feb = days_commuting_feb2020 / days_working_feb2020
  ) |>
  count(frac_days_comm_feb) |>
  mutate(sum = sum(n))

rps_data_may |> 
  filter(emp_simple_refweek > 0) |>
  mutate(
    frac_days_comm_may = days_commuting_refweek / days_working_refweek,
    frac_days_comm_feb = days_commuting_feb2020 / days_working_feb2020
  ) |>
  count(frac_days_comm_may) |>
  mutate(sum = sum(n))
