# This is a replication of the Table 2b pane

#Find all the Values Needed
rps_data_may <- rps_data_release_v3 |>
  filter(month == 5, year == 2020) |>
  select(pid, year, month, week, wgt_research, emp_simple_refweek, emp_detail_refweek, days_working_refweek,
         days_commuting_refweek, days_working_feb2020, days_commuting_feb2020, emp_simple_feb2020)

rps_data_with_fractions <- rps_data_may |>
  filter(days_commuting_feb2020 >= 0.0, emp_simple_refweek >= 0.0) |>
  mutate(
    frac_days_comm_may = days_commuting_refweek / days_working_refweek,
    frac_days_comm_feb = days_commuting_feb2020 / days_working_feb2020
  )

count_employment_may <- rps_data_with_fractions |>
  count(emp_simple_refweek)

count_employment_feb <- rps_data_with_fractions |>
  count(emp_simple_feb2020)


#Everyday May EveryDay Feb
people_commute_everyday_feb_may <- rps_data_with_fractions |>
  filter(frac_days_comm_feb == 1.0, frac_days_comm_may == 1.0)

comm_everyday_feb_and_may <- 
  nrow(people_commute_everyday_feb_may) / nrow(rps_data_with_fractions)

one_1 <- comm_everyday_feb_and_may * 100

#Everyday May Someday Feb
people_comm_everyday_may_some_feb <- rps_data_with_fractions |>
  filter(frac_days_comm_feb > 0.0, frac_days_comm_feb < 1.0, frac_days_comm_may == 1.0)

comm_everyday_may_some_feb <- 
  nrow(people_comm_everyday_may_some_feb) / nrow(rps_data_with_fractions)

one_2 <- comm_everyday_may_some_feb * 100


#Everyday May WFH Feb
people_comm_everyday_may_wfh_feb <- rps_data_with_fractions |>
  filter(frac_days_comm_feb == 0.0, frac_days_comm_may == 1.0)

comm_everyday_may_wfh_feb <- 
  nrow(people_comm_everyday_may_wfh_feb) / nrow(rps_data_with_fractions)

one_3 <- comm_everyday_may_wfh_feb * 100


#Someday May Everyday Feb
people_comm_someday_may_everyday_feb <- rps_data_with_fractions |>
  filter(frac_days_comm_feb == 1.0, frac_days_comm_may > 0.0, frac_days_comm_may < 1.0)

comm_someday_may_everyday_feb <- 
  nrow(people_comm_someday_may_everyday_feb) / nrow(rps_data_with_fractions)

two_1 <- comm_someday_may_everyday_feb * 100

#Someday May Someday Feb
people_comm_someday_may_someday_feb <- rps_data_with_fractions |>
  filter(frac_days_comm_feb > 0.0, frac_days_comm_feb < 1.0, frac_days_comm_may > 0.0, frac_days_comm_may < 1.0)

comm_someday_may_someday_feb <- 
  nrow(people_comm_someday_may_someday_feb) / nrow(rps_data_with_fractions)

two_2 <- comm_someday_may_someday_feb * 100

#Someday May WFH Feb
people_comm_someday_may_wfh_feb <- rps_data_with_fractions |>
  filter(frac_days_comm_feb == 0.0, frac_days_comm_may > 0.0, frac_days_comm_may < 1.0)

comm_someday_may_wfh_feb <- 
  nrow(people_comm_someday_may_wfh_feb) / nrow(rps_data_with_fractions)

two_3 <- comm_someday_may_wfh_feb * 100

#WFH May Everyday Feb
people_comm_wfh_may_everyday_feb <- rps_data_with_fractions |>
  filter(frac_days_comm_feb == 1.0, frac_days_comm_may == 0.0)

comm_wfh_may_everyday_feb <- 
  nrow(people_comm_wfh_may_everyday_feb) / nrow(rps_data_with_fractions)

three_1 <- comm_wfh_may_everyday_feb * 100

#WFH May Someday Feb
people_comm_wfh_may_someday_feb <- rps_data_with_fractions |>
  filter(frac_days_comm_feb > 0.0, frac_days_comm_feb < 1.0, frac_days_comm_may == 0.0)

comm_wfh_may_someday_feb <- 
  nrow(people_comm_wfh_may_someday_feb) / nrow(rps_data_with_fractions)

three_2 <- comm_wfh_may_someday_feb * 100

#WFH May WFH Feb
people_comm_wfh_may_whf_feb <- rps_data_with_fractions |>
  filter(frac_days_comm_feb == 0.0, frac_days_comm_may == 0.0)

comm_wfh_may_whf_feb <- 
  nrow(people_comm_wfh_may_whf_feb) / nrow(rps_data_with_fractions)

three_3 <- comm_wfh_may_whf_feb * 100


people_emp_to_unemp <- count_employment_may$n[1]

#Not Employed May Everyday Feb
people_unemp_may_everyday_feb <- rps_data_with_fractions |>
  filter(emp_simple_refweek == 0, frac_days_comm_feb == 1.0)

unemp_may_everyday_feb <- 
  nrow(people_unemp_may_everyday_feb) / nrow(rps_data_with_fractions)

four_1 <- unemp_may_everyday_feb * 100

#Not Employed May Someday Feb
people_unemp_may_someday_feb <- rps_data_with_fractions |>
  filter(emp_simple_refweek == 0, frac_days_comm_feb > 0.0, frac_days_comm_feb < 1.0)

unemp_may_someday_feb <- 
  nrow(people_unemp_may_someday_feb) / nrow(rps_data_with_fractions)

four_2 <- unemp_may_someday_feb * 100

#Not Employed May WFH Feb
people_unemp_may_wfh_feb <- rps_data_with_fractions |>
  filter(emp_simple_refweek == 0, frac_days_comm_feb == 0.0)

unemp_may_wfh_feb <- 
  nrow(people_unemp_may_wfh_feb) / nrow(rps_data_with_fractions)

four_3 <- unemp_may_wfh_feb * 100

df_rep3 <- data.frame(
  "Commuting Every Day" = round(c(one_1, two_1, three_1, four_1), 1),
  "Commuting Some Days" = round(c(one_2, two_2, three_2, four_2), 1),
  "Working from Home" = round(c(one_3, two_3, three_3, four_3), 1)
)

rownames(df_rep3) <- c("Commuting to Work Every Day", 
                       "Commuting on Some Days", 
                       "Working from Home Every Day",
                       "No Longer Employed"
)

df_rep3 |>
  kable()







