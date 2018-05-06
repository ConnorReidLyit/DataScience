
install.packages('pwr')
library(pwr)

pwr.2p.test()

effect_size <- cohen.ES(test = c('r'), size = c('medium'))
effect_size

effect_vector <- c(0.2, 0.5, 0.8)

pwr.p.test(h = effect_vector, n = , sig.level = .05)



