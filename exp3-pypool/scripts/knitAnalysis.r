Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc')

setwd("/home/dave/Dropbox (Lehigh University)/Research/By Project/Dissertation/experiments/analysis/exp3-pypool/scripts/")

#source('identitiesAndRejections/idCleansing.r')

rmarkdown::render(input = 'preprocessing/exp3Preprocessing.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'auxiliary/pracCued/exp3PracCued.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'exploratory/rapidFire/exp3RapidFire.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'demo/exp3Demo.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'confirmatory/choice/exp3ConfirmatoryChoice.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'confirmatory/performance/exp3ConfirmatoryPerformance.Rmd', output_file = 'index.html')