library(tidyverse)

# biostimulatory thresholds for each index
thrsdat <- read.csv('raw/BIthresholds.csv', stringsAsFactors = F)

# site bs values and bi values
# filter only selected sites
bsbidat <- read.csv('raw/mydf.c3.csv', stringsAsFactors = F) %>% 
  filter(SelectedSample %in% 'Selected') %>% 
  select(-SelectedSample, -New_Lat, -New_Long, -PSA6c, -PCT_MAP) %>% 
  gather('bsvar', 'bsval', Nitrogen_Total_mgPerL:Ash_Free_Dry_Mass_mgPercm2) %>% 
  gather('bivar', 'bival', CSCI:ASCI_H)

# site counts of passing/failing by each target, with probabilities
# filter those where RR.l95.cal and RR.l95.val > 1
tllydat <- read.csv('raw/tab.threshold.rr.summary.csv', stringsAsFactors = F) %>% 
  filter(RR.l95.cal > 1 & RR.l95.val > 1)

save(thrsdat, file = 'data/thrsdat.RData', compress = 'xz')
save(bsbidat, file = 'data/bsbidat.RData', compress = 'xz')
save(tllydat, file = 'data/tllydat.RData', compress = 'xz')