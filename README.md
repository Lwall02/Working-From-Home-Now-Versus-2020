# 🏠 Working-From-Home-Now-Versus-2020

#### Overview

This project replicates and analyzes data from “Work from Home Before and After the COVID-19 Outbreak” (American Economic Review, 2023) by Alexander Bick, Adam Blandin, and Karel Mertens. The study compares employment and commuting behavior in the U.S. between February and May 2020, highlighting how the pandemic reshaped work patterns.

The replication reproduces three tables from the original paper, exploring employment percent change, average days worked per week, and fraction of days commuting. The findings confirm that commuting decreased while working from home increased sharply from February to May 2020. However, this report challenges the original paper’s transition rate calculations between February and May, suggesting methodological differences such as sample weighting and variable treatment.

Replication published on the Social Sciences Reproduction Platform.

#### Data Availability

Data are from the original authors’ replication package:

 - https://doi.org/10.3886/E181641V1
 - https://www.aeaweb.org/articles?id=10.1257/mac.20210061

The main dataset used is the Real-Time Population Survey (RPS), which records employment, days worked, and commuting frequency for approximately 4,941 individuals. Data cleaning and selection were performed in R using the packages tidyverse, haven, and knitr.

#### File Structure

 - `input/data` — raw replication data and initial simulations
 - `outputs/data` — cleaned datasets used for replication
 - `outputs/paper` — Quarto document, references, and PDF of the final paper
 - `scripts` — R scripts for cleaning, processing, and reproducing tables

#### Key Findings

 - Employment rate fell by 30.4 log points between February and May 2020.
 - Average days worked per week remained stable (4.8 → 4.6).
 - Fraction of workdays commuting dropped by 35.7 log points, while remote work rose from 8.2% to 33.3%.
 - About 14.4% of individuals who commuted daily in February worked entirely from home by May.
