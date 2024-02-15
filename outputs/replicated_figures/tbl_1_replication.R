# This is the replication of the first graph - Table 1

library(tidyverse)
library(knitr)

# Retrieve and clean 
rps_data_may <- rps_data_release_v3 |>
  filter(month == 5, year == 2020) |>
  select(pid, year, month, week, wgt_research, emp_simple_refweek, emp_detail_refweek, days_working_refweek,
         days_commuting_refweek, days_working_feb2020, days_commuting_feb2020, emp_simple_feb2020)


count_days_worked_may <- rps_data_may |>
  count(emp_simple_refweek) 

count_days_worked_feb <- rps_data_may |>
  count(emp_simple_feb2020)

count_emp_detailed_may <- rps_data_may |>
  count(emp_detail_refweek)

  
employment_rate_feb <- count_days_worked_feb$n[3] / 4941
employment_rate_may <- count_days_worked_may$n[3] / 4941
  

avg_days_worked_may <- mean(rps_data_may$days_working_refweek[rps_data_may$days_working_refweek > 0])
avg_days_worked_feb <- mean(rps_data_may$days_working_feb2020[rps_data_may$days_working_feb2020 > 0])


# Add a column for fraction of workdays commuting
rps_data_with_fractions <- rps_data_may |> 
  filter(days_working_refweek >= 0, days_working_feb2020 >= 0) |>
  mutate(
    frac_days_comm_may = days_commuting_refweek / days_working_refweek,
    frac_days_comm_feb = days_commuting_feb2020 / days_working_feb2020
  )

avg_frac_may <- mean(rps_data_with_fractions$frac_days_comm_may)  
avg_frac_feb <- mean(rps_data_with_fractions$frac_days_comm_feb)  

emp_rate_log_points <- round(100 * log(employment_rate_may / employment_rate_feb), 1)
avg_days_log_points <- round(100 * log(avg_days_worked_may / avg_days_worked_feb), 1)
frac_workday_comm <- round(100 * log(avg_frac_may / avg_frac_feb), 1)

total_log_points <- 100 * log(employment_rate_may / employment_rate_feb) + 
  100 * log(avg_days_worked_may / avg_days_worked_feb) +
  100 * log(avg_frac_may / avg_frac_feb)



# Now to display the table
df_rep1 <- data.frame(
  "February" = round(c(employment_rate_feb * 100, round(avg_days_worked_feb, 1), avg_frac_feb * 100), 1),
  "May" = round(c(employment_rate_may * 100, round(avg_days_worked_may, 1), avg_frac_may * 100), 1),
  "Change_in_Log_Points" = c(emp_rate_log_points, avg_days_log_points, frac_workday_comm
  )
) 


df_rep1 <- df_rep1 |>
  add_row(February = as.integer(""), May = as.integer(""), 
          Change_in_Log_Points = round(total_log_points, 1))


rownames(df_rep1) <- c("Employment Rate (%)", 
                       "Avg. Daysorked Per Week", 
                       "Fractions of Workdays Commuting (%)",
                       "Log Points Change in Weekly Commuting Trips:")

df_rep1 |>
  kable()




