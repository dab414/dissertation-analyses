Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc')

rmarkdown::render(input = '/home/dave/OneDrive/Research/By\ Project/Dissertation/experiments/analysis/exp2/scripts/confirmatory/performance/exp2ConfirmatoryPerformance.Rmd', output_file = 'index.html')

rmarkdown::render(input = '/home/dave/OneDrive/Research/By\ Project/Dissertation/experiments/analysis/exp3/scripts/confirmatory/performance/exp3ConfirmatoryPerformance.Rmd', output_file = 'index.html')