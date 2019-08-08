## WDs are relative to scripts/
setwd('/home/dave/OneDrive/Research/By Project/Dissertation/experiments/analysis/exp3/scripts/')
library(tidyverse)

pracCued <- read.csv('../data/pracCued.csv')
dst <- read.csv('../data/dst.csv')
demo <- read.csv('../data/demo.csv')
rapidFire <- read.csv('../data/rapidFire.csv')

demo <- demo %>% 
  group_by(workerId) %>% 
  summarize(l = n()) %>% 
  mutate(check = ifelse(l > 1, 1, 0))

if (sum(demo$check)) {
  print("At least one worker completed the experiment more than once!")
}

demo <- read.csv('../data/demo.csv')

nDst <- dst %>% 
  group_by(workerId) %>% 
  summarize(n()) %>% 
  nrow()

nPracCued <- pracCued %>% 
  group_by(workerId) %>% 
  summarize(n()) %>% 
  nrow()

nDemo <- nrow(demo)

if (nDemo != nDst | nDemo != nPracCued | nPracCued != nDst) {
  print("Inconsistent number of subjects across phases!")
}

demo$subject <- 1:(nrow(demo))

idKeys <- demo %>% 
  select(workerId, curId, subject)

demo <- demo %>% 
  select(-workerId, -curId)

dst <- idKeys %>% 
  inner_join(dst) %>% 
  select(-workerId, -curId)

pracCued <- idKeys %>% 
  inner_join(pracCued) %>% 
  select(-workerId, -curId)

rapidFire <- idKeys %>% 
  inner_join(rapidFire) %>% 
  select(-workerId, -curId)

write.csv(idKeys, 'identitiesAndRejections/idKeys.csv', row.names = FALSE)
write.csv(pracCued, '../data/pracCued.csv', row.names = FALSE)
write.csv(dst, '../data/dst.csv', row.names = FALSE)
write.csv(rapidFire, '../data/rapidFire.csv', row.names = FALSE)
write.csv(demo, '../data/demo.csv', row.names = FALSE)




