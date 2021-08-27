install.packages("ggplot2")
install.packages("tibble")
library(rvest)
library(ggplot2)
library(tibble)

page <- read_html("https://www.decolar.com/hoteis/hl/5648/i1/hoteis-em-porto+de+galinhas")

names <- page %>% html_elements(".offer-card-title") %>% html_text2() %>% as_tibble()
rate <- page %>% html_elements(".rating-text") %>% html_text2() %>% as_tibble()

best_hotels <- tibble(
  hotels = names,
  rate = rate
)

ggplot(best_hotels,
       aes(x = unlist(hotels), y = unlist(rate), fill=unlist(hotels))
       ) + geom_bar(stat='identity') + ggtitle("Most populars Porto de Galinhas' hotels by decolar.com") + labs(x = "", y = "", fill = "Hotels")
