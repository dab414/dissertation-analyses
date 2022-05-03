library(tidyverse)

d <- read.csv('dst.csv')

head(d)

N <- length(unique(d$subject))

## drop out cued trials
d <- d[d$cuedTrial == 1,]

  

## what proportion of subjects align with general trend

aligned_subjects <- d %>% 
  group_by(subject, difficulty) %>% 
  summarize(srd = mean(selectedRiskyDeck)) %>% 
  spread(difficulty, srd) %>% 
  filter(`Easier than Reference` > `Harder than Reference`) %>% 
  select(subject)

aligned_subjects <- aligned_subjects$subject

aligned_count <- length(aligned_subjects)

print(paste0(round((aligned_count / N) * 100, 2), '% of subjects are aligned with general trend.'))


## look at stuff over time ##
whole <- d
d <- d[d$subject %in% aligned_subjects,]

## start with raw data

d$aligned <- ifelse((d$difficulty == 'Easier than Reference' & d$selectedRiskyDeck == 1) | (d$difficulty == 'Harder than Reference' & d$selectedRiskyDeck == 0), 'Aligned', 'Not Aligned')

s <- d[d$subject %in% aligned_subjects[1:5], c('subject', 'difficulty', 'selectedRiskyDeck', 'choiceTrial', 'aligned')]

d %>% 
  
  ggplot(aes(x = choiceTrial, y = aligned)) + 
  #geom_line(aes(group = subject)) + 
  geom_jitter(width = .15, height = .1, alpha = .2) + 
  labs(
    x = 'Trial',
    y = 'Selected Risky Deck'
  ) #+ 
  #facet_grid(rows = vars(subject)) +
  #scale_color_manual(values = c('Aligned' = 'Green', 'Not Aligned' = 'Red'))


## average across subjects

d %>% 
  group_by(difficulty, choiceTrial) %>% 
  summarize(srd = mean(selectedRiskyDeck), se = sd(selectedRiskyDeck) / sqrt(aligned_count)) %>% 
  ggplot(aes(x = choiceTrial, y = srd)) + 
  geom_ribbon(aes(ymin = srd - se, ymax = srd + se, fill = difficulty), alpha = .2) + 
  geom_line(aes(color = difficulty)) + 
  ylim(0, 1) + 
  labs(
     x = 'Trial', 
     y = 'Proportion Selected Risky Deck',
     color = 'Direction',
     fill = 'Direction',
     caption = 'This is only for those subjects who show the overall trend.'
  ) + 
  theme_bw() + 
  theme(legend.position = c(.1,.2))


whole %>% 
  group_by(difficulty, choiceTrial) %>% 
  summarize(srd = mean(selectedRiskyDeck), se = sd(selectedRiskyDeck) / sqrt(aligned_count)) %>% 
  ggplot(aes(x = choiceTrial, y = srd)) + 
  geom_ribbon(aes(ymin = srd - se, ymax = srd + se, fill = difficulty), alpha = .2) + 
  geom_line(aes(color = difficulty)) + 
  ylim(0, 1) + 
  labs(
    x = 'Trial', 
    y = 'Proportion Selected Risky Deck',
    color = 'Direction',
    fill = 'Direction'
  ) + 
  theme_bw() + 
  theme(legend.position = c(.1,.2))
  

whole$choiceTrial_c <- whole$choiceTrial - 20

m1 <- glm(selectedRiskyDeck ~ choiceTrial_c * difficulty, data = whole, family = binomial(link = 'logit'))
    
  
















