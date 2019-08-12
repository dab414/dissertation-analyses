Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc')

rmarkdown::render(input = '/home/dave/OneDrive/Research/By\ Project/Dissertation/experiments/analysis/exp2/scripts/confirmatory/choice/exp2ConfirmatoryChoice.Rmd', output_file = 'index.html')

rmarkdown::render(input = '/home/dave/OneDrive/Research/By\ Project/Dissertation/experiments/analysis/exp3/scripts/confirmatory/choice/exp3ConfirmatoryChoice.Rmd', output_file = 'index.html')