# This is a replication of the Table 2 pane A

library(tidyverse)
library(knitr)

#Find all the Values Needed
rps_data_may <- rps_data_release_v3 |>
  filter(month == 5, year == 2020) |>
  select(pid, year, month, week, wgt_research, emp_simple_refweek, emp_detail_refweek, days_working_refweek,
         days_commuting_refweek, days_working_feb2020, days_commuting_feb2020, emp_simple_feb2020)

rps_data_with_fractions <- rps_data_may |> 
  filter(days_working_refweek >= 0, days_working_feb2020 >= 0) |>
  mutate(
    frac_days_comm_may = days_commuting_refweek / days_working_refweek,
    frac_days_comm_feb = days_commuting_feb2020 / days_working_feb2020
  )

count_frac_days_feb <- rps_data_with_fractions |>
  count(frac_days_comm_feb) 

count_frac_days_may <- rps_data_with_fractions |>
  count(frac_days_comm_may)

comm_work_everyday_feb <- count_frac_days_feb$n[19] / sum(count_frac_days_feb$n)
comm_work_everyday_may <- count_frac_days_may$n[19] / sum(count_frac_days_may$n)

comm_work_some_feb <- sum(count_frac_days_feb$n[2:18]) / sum(count_frac_days_feb$n)
comm_work_some_may <- sum(count_frac_days_may$n[2:18]) / sum(count_frac_days_may$n)

wfh_feb <- sum(count_frac_days_feb$n[1]) / sum(count_frac_days_feb$n)
wfh_may <- sum(count_frac_days_may$n[1]) / sum(count_frac_days_may$n)


#Display the Table
df_rep2 <- data.frame(
  "February" = round(c(comm_work_everyday_feb * 100, comm_work_some_feb * 100, wfh_feb * 100), 1),
  "May" = round(c(comm_work_everyday_may * 100, comm_work_some_may * 100, wfh_may * 100), 1)
  )

rownames(df_rep2) <- c("Commuting to Work Every Day", 
                       "Commuting on Some Days", 
                       "Working from Home Every Day"
                       )

df_rep2 |>
  kable()



