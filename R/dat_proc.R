library(tidyverse)
library(sf)

##
# biostimulatory thresholds for each index
thrsdat <- read.csv('raw/BIthresholds.csv', stringsAsFactors = F) %>% 
  gather('BIgoal', 'glval', -Index) %>% 
  rename(Response = Index)

##
# site bs values and bi values
# filter only selected sites
bsbidat <- read.csv('raw/mydf.c3.csv', stringsAsFactors = F) %>% 
  filter(
    SelectedSample %in% 'Selected' &
    Replicate %in% 1
    ) %>% 
  select(-SelectedSample, -New_Lat, -New_Long, -PSA6c, -Replicate) %>% 
  gather('BSPretty', 'bsval', Nitrogen_Total_mgPerL:PCT_MAP) %>% 
  gather('Response', 'bival', CSCI:ASCI_H) %>% 
  mutate(
    BSPretty = factor(BSPretty, 
                   levels = c('Nitrogen_Total_mgPerL',	'Phosphorus_as_P_mgPerL', 'Chlorophyll_a_mgPerm2', 'Ash_Free_Dry_Mass_mgPercm2', 'PCT_MAP'),
                   labels = c('Total N', 'Total P', 'Chl-a', 'AFDM', '% cover')
    ), 
    BSPretty = as.character(BSPretty)
  )

# get constrained/unconstrained from landscape_mod repo, join with bsbidat
load(file = '../../Channels in developed landscapes_RM/Marcus/landscape_mod/data/calicls.RData')
load(file = '../../Channels in developed landscapes_RM/Marcus/landscape_mod/data/csci_comid.RData')

# get stream class by comid
allcls <- calicls %>% 
  select(COMID, strcls)
st_geometry(allcls) <- NULL

# join site, comid, stream class
cscicom <- csci_comid %>% 
  select(StationCode, COMID) %>% 
  inner_join(allcls, by = 'COMID') %>% 
  unique %>% 
  select(-COMID) %>% 
  rename(MasterID = StationCode)

# join stream class with bsbi data
bsbidat <- bsbidat %>% 
  left_join(cscicom, by = 'MasterID')

##
# site counts of passing/failing by each target, with probabilities
# filter those where RR.l95.cal and RR.l95.val > 1
tllydat <- read.csv('raw/tab.threshold.rr.summary.csv', stringsAsFactors = F) %>% 
  filter(RR.l95.cal > 1 & RR.l95.val > 1)

save(thrsdat, file = 'data/thrsdat.RData', compress = 'xz')
save(bsbidat, file = 'data/bsbidat.RData', compress = 'xz')
save(tllydat, file = 'data/tllydat.RData', compress = 'xz')