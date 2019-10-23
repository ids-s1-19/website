# load packages ----------------------------------------------------------------

library(tidyverse)

# iterate ----------------------------------------------------------------------

# the following line is commented out as running it will take a while
# get ready to be patient if you want to run it

uoe_art_info_1 <- map_dfr(uoe_art$link[1:500], scrape_art_info)
uoe_art_info_2 <- map_dfr(uoe_art$link[501:1000], scrape_art_info)
uoe_art_info_3 <- map_dfr(uoe_art$link[1001:1500], scrape_art_info)
uoe_art_info_4 <- map_dfr(uoe_art$link[1501:2000], scrape_art_info)
uoe_art_info_5 <- map_dfr(uoe_art$link[2001:2500], scrape_art_info)
uoe_art_info_6 <- map_dfr(uoe_art$link[2501:2909], scrape_art_info)
