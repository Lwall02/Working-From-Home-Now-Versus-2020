# Working-From-Home-Now-Versus-2020

## Overview
This is a replication of "Work from Home before and after the COVID-19 Outbreak" in the American Economic Review and a follow up report and discussion of the changes in working from home since 2020. I have replicated three tables from this article and published a replication on the Social Sciences Reproduction Platform, https://doi.org/10.48152/ssrp-kcy8-rm90. 

This report replicates and analyses data from the US during February and May 2020 regarding employment and commuting behavior. In this reproduction, I display similarities to the original paper through employment percent change over February and May, average days worked per week, and fraction of days commuting. I delve deeper into the commuting behavior of individuals and find that commuting to work decreased while working from home increased greatly from February to May 2020. However, this paper challenges the results regarding the February to May transition rates (comparison metween commuting behavior in February vs May per individual) and offers discusion as to why.

## Data Availability
The data used for this report can be found in the original papers' replication package. https://doi.org/10.3886/E181641V1 or https://www.aeaweb.org/articles?id=10.1257/mac.20210061.
The data can be downloaded through these websites however it is currently behind a sign-in page. In order to replicate the data, using the exact data sets in the original paper, I have downloaded the file rps_data_release_v3.dta to my local computer. The downloading and cleaning takes place in `input/data` file.

## File Structure
The repo is structured as:

-   `input/data` contains the raw replication data used in analysis as well as skectches of my simulation of relevant data and a graph
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


