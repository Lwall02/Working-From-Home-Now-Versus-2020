# Test the data I cleaned in clean_data.R

library(tidyverse)
# install.packages("testthat")
library(testthat)

rps_data_release_v3 <- read_dta(file = "/Users/liamwall/Working-From-Home-Now-Versus-2020/inputs/data/rps_data_release_v3.dta")

rps_data_may <- rps_data_release_v3 |>
  filter(month == 5, year == 2020) |>
  select(pid, year, month, week, wgt_research, emp_simple_refweek, emp_detail_refweek, 
         days_working_refweek, days_commuting_refweek, days_working_feb2020, 
         days_commuting_feb2020, emp_simple_feb2020)

test_that("All expected columns are there", {
  expect_true("pid" %in% colnames(rps_data_may))
  expect_true("year" %in% colnames(rps_data_may))
  expect_true("month" %in% colnames(rps_data_may))
  expect_true("month" %in% colnames(rps_data_may))
  expect_true("month" %in% colnames(rps_data_may))
  expect_true("emp_simple_refweek" %in% colnames(rps_data_may))
  expect_true("emp_detail_refweek" %in% colnames(rps_data_may))
  expect_true("days_working_refweek" %in% colnames(rps_data_may))
  expect_true("days_commuting_refweek" %in% colnames(rps_data_may))
  expect_true("days_working_feb2020" %in% colnames(rps_data_may))
  expect_true("days_commuting_feb2020" %in% colnames(rps_data_may))
  expect_true("emp_simple_feb2020" %in% colnames(rps_data_may))
})


test_that("No NAs where there shouldn't be any", {
  expect_equal(sum(is.na(rps_data_may$emp_simple_refweek)), 0)
  expect_equal(sum(is.na(rps_data_may$emp_detail_refweek)), 0)
  expect_equal(sum(is.na(rps_data_may$days_commuting_refweek)), 0)
})