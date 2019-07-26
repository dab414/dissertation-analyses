Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc')

setwd('/home/dave/OneDrive/Research/By\ Project/Dissertation/experiments/analysis/exp2/scripts/')

source('identitiesAndRejections/idCleansing.r')

rmarkdown::render(input = 'preprocessing/exp2Preprocessing.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'exploratory/rapidFire/exp2RapidFire.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'demo/exp2Demo.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'confirmatory/choice/exp2ConfirmatoryChoice.Rmd', output_file = 'index.html')