## called from ../preprocessing/

library(tidyverse)

reject <- read.csv('../../data/dst.csv')
demo <- read.csv('../../data/demo.csv')

reject <- reject %>% 
  group_by(subject) %>% 
  summarize(error = mean(error), rt = mean(cuedRt)) %>% 
  filter(error > .35 | rt < 400)

idKeys <- read.csv('../identitiesAndRejections/idKeys.csv')

reject <- idKeys %>% 
  inner_join(reject)

reject <- demo %>%
	select(subject, comments) %>%
	inner_join(reject)

write.csv(reject, '../identitiesAndRejections/rejectList.csv', row.names = FALSE)