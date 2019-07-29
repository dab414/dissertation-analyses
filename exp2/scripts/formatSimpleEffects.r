formatSimpleEffects <- function(model, omnibusParams) {
  SSn <- model$ANOVA$SSn[2]
  DFn <- model$ANOVA$DFn[2]
  MSn <- SSn/ DFn
  f_value <- MSn / omnibusParams['MSe']
  p_value <- pf(f_value, DFn, omnibusParams['DFd'], lower.tail = FALSE)
  n2p <- SSn / (SSn + omnibusParams['SSd'])
  return(paste('F(',DFn, ', ', omnibusParams['DFd'], ') = ', round(f_value, 2), ', p = ', round(p_value, 2), ', n2p = ', round(n2p, 2), sep = ''))
  
}