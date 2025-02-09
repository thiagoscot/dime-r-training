# Data
base_nfe <- read.csv('/Users/tscot/Downloads/Treinamento_SEFAZ/base_nfe.csv')
View(base_nfe)

# Exercise 1
#install.packages("modelsummary")
#install.packages("huxtable")
#install.packages("pandoc")

# Exercise 2
result_scenario1 <- base_nfe %>% 
  filter(mes_emissao == 12) %>%
  arrange(-vprod) %>%
  filter(row_number() <= 50)

# Exercise 3
library(modelsummary)
datasummary_skim(base_nfe)

# Exercise 4
datasummary(
  vprod + vicms ~ N + Mean + SD + Min + Max,
  base_nfe
)

# Exercise 5
library(huxtable)
stats_table <- datasummary_skim(base_nfe, output = "huxtable")
quick_xlsx(stats_table, file = "quick_stats.xlsx")

# Exercise 6
stats_table_custom <- stats_table %>%
  set_header_rows(1, TRUE) %>%
  set_header_cols(1, TRUE)  %>%
  set_number_format(everywhere, 2:ncol(.), "%9.0f") %>%
  set_align(1, everywhere, "center") %>%
  theme_basic()
quick_xlsx(
  stats_table_custom,
  file = "stats-custom.xlsx"
)
