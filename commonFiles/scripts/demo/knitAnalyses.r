Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc')

rmarkdown::render(input = '/home/dave/OneDrive/Research/By\ Project/Dissertation/experiments/analysis/exp2/scripts/demo/exp2Demo.Rmd', output_file = 'index.html')

rmarkdown::render(input = '/home/dave/OneDrive/Research/By\ Project/Dissertation/experiments/analysis/exp3/scripts/demo/exp3Demo.Rmd', output_file = 'index.html')