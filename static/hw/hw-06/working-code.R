# ------------------------------------------------------------------------------
# 01-scrape-pac-2020.R: scrape information for 2020 contributions
# ------------------------------------------------------------------------------

# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

# define url -------------------------------------------------------------------

url_2020 <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs?cycle=2020"

# read the page ----------------------------------------------------------------

page <- read_html(url_2020)

# exract the table -------------------------------------------------------------

pac_2020 <-  page %>%
  html_node(".DataTable") %>%
  html_table("td", header = TRUE, fill = TRUE) %>%
  as_tibble()

# rename variables -------------------------------------------------------------

pac_2020 <- pac_2020 %>%
  rename(
    name = `PAC Name (Affiliate)` ,
    country_parent = `Country of Origin/Parent Company`,
    total = Total,
    dems = Dems,
    repubs = Repubs
  )

# fix name ---------------------------------------------------------------------

pac_2020 <- pac_2020 %>%
  mutate(name = str_squish(name))

# write file -------------------------------------------------------------------

write_csv(pac_2020, here::here("static/hw/hw-06/data", "pac-2020.csv"))

# ------------------------------------------------------------------------------
# 02-scrape-pac-function.R: function to scrape information for all contributions
# ------------------------------------------------------------------------------

# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

# function: scrape_pac ---------------------------------------------------------

scrape_pac <- function(url) {
  
  # read the page
  page <- read_html(url)
  
  # exract the table
  pac <-  page %>%
    html_node(".DataTable") %>%
    html_table("td", header = TRUE, fill = TRUE) %>%
    as_tibble()
  
  # rename variables
  pac <- pac %>%
    rename(
      name = `PAC Name (Affiliate)` ,
      country_parent = `Country of Origin/Parent Company`,
      total = Total,
      dems = Dems,
      repubs = Repubs
    )
  
  # fix name
  pac <- pac %>%
    mutate(name = str_squish(name))
  
  # add year
  pac <- pac %>%
    mutate(year = str_sub(url, -4))
  
  # return data frame
  pac
  
}

# test function ----------------------------------------------------------------

url_2020 <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs?cycle=2020"
pac_2020_fn <- scrape_pac(url_2020)

url_2018 <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs?cycle=2018"
pac_2018 <- scrape_pac(url_2018)

url_1998 <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs?cycle=1998"
pac_1998 <- scrape_pac(url_1998)

# write files -------------------------------------------------------------------

write_csv(pac_2020_fn, here::here("static/hw/hw-06/data", "pac-2020-fn.csv"))
write_csv(pac_2018, here::here("static/hw/hw-06/data", "pac-2018.csv"))
write_csv(pac_1998, here::here("static/hw/hw-06/data", "pac-1998.csv"))

# ------------------------------------------------------------------------------
# 03-scrape-pac-all.R: map scrape_pac() over all years
# ------------------------------------------------------------------------------

# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

# list of urls -----------------------------------------------------------------

root <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs?cycle="
year <- seq(from = 1998, to = 2020, by = 2)
urls <- paste0(root, year)

# map --------------------------------------------------------------------------

pac_all <- map_dfr(urls, scrape_pac)

# write data -------------------------------------------------------------------

write_csv(pac_all, path = here::here("static/hw/hw-06/data", "pac-all.csv"))

# ------------------------------------------------------------------------------
# data cleaning
# ------------------------------------------------------------------------------

# fix country_parent -----------------------------------------------------------

pac_all <- pac_all %>%
  separate(country_parent, into = c("country", "parent"), sep = "/", extra = "merge")

# fix dollar amounts -----------------------------------------------------------

parse_currency <- function(x){
  x %>% 
    str_remove("\\$") %>%
    str_remove_all(",") %>%
    as.numeric()
}

pac_all <- pac_all %>%
  mutate(
    total = parse_currency(total),
    dems = parse_currency(dems),
    repubs = parse_currency(repubs)
    )

# write data -------------------------------------------------------------------

write_csv(pac_all, path = here::here("static/hw/hw-06/data", "pac-all-clean.csv"))

# ------------------------------------------------------------------------------
# data visualization
# ------------------------------------------------------------------------------

# UK and Canada contributions --------------------------------------------------

pac_all %>%
  filter(country %in% c("Canada", "UK")) %>%
  group_by(country, year) %>%
  summarise(tot = sum(total)) %>%
  ggplot(aes(x = year, y = tot, group = country, color = country)) +
  geom_line()

# UK contributions to democrats and republicans --------------------------------

library(scales)

pac_all %>%
  filter(
    country == "UK",
    year < 2020
    ) %>%
  group_by(year) %>%
  summarise(
    Democrat = sum(dems),
    Republican = sum(repubs)
  ) %>%
  pivot_longer(cols = c(Democrat, Republican), names_to = "party", values_to = "amount") %>%
  ggplot(aes(x = year)) +
  geom_line(aes(y = amount, group = party, color = party)) +
  scale_color_manual(values = c("blue", "red")) +
  scale_y_continuous(labels = dollar_format(scale = 0.000001, suffix = "M")) +
  labs(
    x = "Year",
    y = "Amount",
    color = "Party",
    title = "Contribution to US politics from UK-Connected PACs",
    subtitle = "By party, over time"
  ) +
  theme_minimal()
