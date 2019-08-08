formatSimpleEffects <- function(model, omnibusParams) {
  index <- nrow(model$ANOVA)
  SSn <- model$ANOVA$SSn[index]
  DFn <- model$ANOVA$DFn[index]
  MSn <- SSn/ DFn
  f_value <- MSn / omnibusParams['MSe']
  p_value <- pf(f_value, DFn, omnibusParams['DFd'], lower.tail = FALSE)
  n2p <- SSn / (SSn + omnibusParams['SSd'])
  return(paste('F(',DFn, ', ', omnibusParams['DFd'], ') = ', round(f_value, 3), ', p = ', round(p_value, 3), ', n2p = ', round(n2p, 2), sep = ''))
  
}