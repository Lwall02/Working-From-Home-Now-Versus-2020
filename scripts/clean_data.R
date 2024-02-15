# In this script I will clean the data to the most usable form for each of my tables
# Any extra columns added or analysis can be conducted from this cleaned table

# Luckily all the name s straight from the RPS data set are R complete-able and do not need fixing
library(haven)

rps_data_release_v3 <- 
  read_dta(file = "/Users/liamwall/Working-From-Home-Now-Versus-2020/inputs/data/rps_data_release_v3.dta")

rps_data_may <- rps_data_release_v3 |>
  filter(month == 5, year == 2020) |>
  select(pid, year, month, week, wgt_research, emp_simple_refweek, 
         emp_detail_refweek, days_working_refweek, days_commuting_refweek, 
         days_working_feb2020, days_commuting_feb2020, emp_simple_feb2020)

write_dta(rps_data_may, path = 
      "/Users/liamwall/Working-From-Home-Now-Versus-2020/outputs/cleaned_data/cleaned_rps_data_may.dta")
