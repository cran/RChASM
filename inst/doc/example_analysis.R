## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(RChASM)
library(magrittr)
library(mclust)

## -----------------------------------------------------------------------------
data(example_data)

## -----------------------------------------------------------------------------
# An example of data that RChASM analyses (omitting columns for chromosomes 3 to 20).
example_data %>%
  dplyr::select(sample, protocol, chr1, chr2, chr21, chr22, X, Y) %>%
  head()

## ----fig.dim=c(6,4)-----------------------------------------------------------
example_calls <- runChASM(rawReadCountsIn = example_data)

## -----------------------------------------------------------------------------
summary_calls(inChASM = example_calls, minTotal = 6e4, minPosterior = 0.95)

## -----------------------------------------------------------------------------
printChASM(inChASM = example_calls, lines = 10)

## ----eval=FALSE---------------------------------------------------------------
# saveChASM(inChASM = example_calls)

## ----eval=FALSE---------------------------------------------------------------
# saveChASM(inChASM = example_calls, sort_by_samplename = TRUE)

## ----fig.dim=c(7.2,5),warning=FALSE-------------------------------------------
plot_diagnostic(IDs = 'Ind_255_1', inChASM = example_calls, addLabels = TRUE)

## ----fig.dim=c(7.2,5),warning=FALSE-------------------------------------------
plot_diagnostic(
  IDs = c('Ind_71_1', 'Ind_185_1'),
  inChASM = example_calls,
  addLabels = TRUE
)


## ----fig.dim=c(7.2,5),warning=FALSE-------------------------------------------
plot_diagnostic(
  IDs = c('Ind_4_1', 'Ind_66_1'),
  inChASM = example_calls,
  addLabels = TRUE
)

## ----eval=FALSE---------------------------------------------------------------
# bash
# CHASM_input - i
# Input_Bams.txt - o
# Output_Table.tsv

## ----eval=FALSE---------------------------------------------------------------
# example_data <- readr::read_tsv('/path_to_folder/Output_Table.tsv')

