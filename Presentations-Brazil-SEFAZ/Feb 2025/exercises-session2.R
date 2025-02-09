# Exercicio 3
library(dplyr)
library(data.table)


# Data
base_nfe <- read.csv('/Users/tscot/Downloads/Treinamento_SEFAZ/base_nfe.csv')
base_emissor <- read.csv('/Users/tscot/Downloads/Treinamento_SEFAZ/base_emissor.csv')


# Exercicio 5
temp1 <- filter(base_nfe, mes_emissao == 10)
temp2 <- arrange(temp1, -vprod)
result_scenario1 <- filter(temp2, row_number() <= 50)

# Exercicio 6
temp1 <- select(base_nfe, nfuid_anon, emitcnpj8_anon, vicms)
temp2 <- left_join(temp1, base_emissor, by = "emitcnpj8_anon")
temp3 <- filter(temp2, emituf != "RS")
total_income <- summarise(temp3, sum(vicms))

# Exercicio 7
temp1 <- select(base_nfe, xprod, vprod)
temp2 <- group_by(temp1, xprod)
product_df <- summarize(temp2,
                        total = sum(vprod),
                        average = mean(vprod))
