## im just quickly looking at the suggestion from clang (spring 2022) to see whether differences in choice rts predicts differences in risk preference

library(tidyverse)

e3a <- read.csv('../../../../exp3/data/dstCleanChoice1.csv')
e3a_demo <- read.csv('../../../../exp3/data/demoClean.csv')
e3b <- read.csv('../../../data/dstCleanChoice1.csv')
e3b_demo <- read.csv('../../../data/demoClean.csv')
e3b_demo$age <- as.integer(e3b_demo$age)

e3a$experiment <- 'e3a'
e3b$experiment <- 'e3b'

e3a <- e3a_demo %>% 
  select(subject, age) %>% 
  inner_join(e3a) 
  
e3b <- e3b_demo %>% 
  select(subject, age) %>% 
  inner_join(e3b) 
  

keep <- c('subject', 'choiceRt', 'difficulty', 'selectedRiskyDeck', 'experiment', 'age')


d <- rbind(e3a[,keep], e3b[,keep])


p <- d %>% 
  group_by(subject) %>% 
  summarize(choice_rt = mean(choiceRt), age = unique(age)) %>% 
  inner_join(d) %>% 
  select(-choiceRt) %>% 
  mutate(ssd = 1 - selectedRiskyDeck) %>% 
  group_by(subject, difficulty) %>% 
  summarize(ssd = mean(ssd), choice_rt = unique(choice_rt), age = unique(age)) %>% 
  spread(difficulty, ssd) %>% 
  mutate(in_line = `Harder than Reference` - `Easier than Reference`) 


## does their choice rt predict the extent to which they're in line with the overall trend?

p %>% 
  gather(var, value, choice_rt, age) %>% 
  ggplot(aes(x = value, y = in_line)) + 
  geom_point() + 
  geom_smooth(method = 'lm') + 
  facet_wrap(~var, scales = 'free')


cor.test(p$choice_rt, p$in_line)

## not really


## what about age?
cor.test(p$age, p$in_line)











