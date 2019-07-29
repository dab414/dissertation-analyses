Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc')

setwd('/home/dave/OneDrive/Research/By\ Project/Dissertation/experiments/analysis/exp1/scripts/')

source('identitiesAndRejections/idCleansing.r')

rmarkdown::render(input = 'preprocessing/exp1Preprocessing.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'confirmatory/choice/exp1ConfirmatoryChoice.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'confirmatory/performance/exp1ConfirmatoryPerformance.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'demo/exp1Demo.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'auxiliary/movingReference/exp1MovingReference.Rmd', output_file = 'index.html')

rmarkdown::render(input = 'auxiliary/learning/exp1learning.Rmd', output_file = 'index.html')

