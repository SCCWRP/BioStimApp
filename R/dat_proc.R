library(tidyverse)

# biostimulatory thresholds for each index
thrsdat <- read.csv('raw/BIthresholds.csv', stringsAsFactors = F)

# site bs values and bi values
bsbidat <- read.csv('raw/mydf.c3.csv', stringsAsFactors = F)

# site counts of passing/failing by each target, with probabilities
tllydat <- read.csv('raw/tab.threshold.rr.summary.csv', stringsAsFactors = F)

save(thrsdat, file = 'data/thrsdat.RData', compress = 'xz')
save(bsbidat, file = 'data/bsbidat.RData', compress = 'xz')
save(tllydat, file = 'data/tllydat.RData', compress = 'xz')