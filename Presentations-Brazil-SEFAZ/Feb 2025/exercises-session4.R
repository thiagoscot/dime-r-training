# Data
base_nfe <- read.csv('/Users/tscot/Downloads/Treinamento_SEFAZ/base_nfe.csv')

# Exercise 1a
library(ggplot2)
ggplot(base_nfe) +
  aes(x = mes_emissao,
      y = vicms) +
  geom_col() +
  labs(title = "Total de ICMS por mes")

# Exercise 1b
ggplot(base_nfe) +
  aes(x = as.factor(mes_emissao),    #as.factor() informa que mes_emissao nao é numero mas categorias
      y = vicms) +
  geom_col() +
  labs(title = "Total de ICMS por mes",
       # x-axis title
       x = "Mês",
       # y-axis title
       y = "Valor ICMS (R$") +
  # telling R not to break the x-axis
  scale_x_discrete(labels = c("Outubro", "Novembro", "Dezembro")) +
  #excludes background lines & color
  theme_classic() + 
  # centering plot title
  theme(plot.title = element_text(hjust = 0.5)) 

# Exercise 1c
ggsave("base_nfe_totals.png",
       width = 20,
       height = 10,
       units = "cm")

# Exercise 2a
df_group_month <- base_nfe %>%
  filter(emitcnpj8_anon %in% c(34942603, 23356886,33756669)) %>% 
  select(emitcnpj8_anon, mes_emissao, vicms) %>%
  group_by(emitcnpj8_anon, mes_emissao) %>%
  summarize(total = sum(vicms)) %>% 
  ungroup()

# Exercise 2b
ggplot(df_group_month) +
  aes(x = mes_emissao,
      y = total) +
  geom_line(aes(color = as.factor(emitcnpj8_anon))) +
  labs(title = "Total de ICMS por mes - por emissor",
       x = "Mes",
       y = "ICMS (R$)") +
  scale_x_continuous(breaks = c(10,11,12)) +
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme_classic()

# Exercise 2c
ggplot(df_group_month) +
  aes(x = mes_emissao,
      y = total) +
  geom_line(aes(color = as.factor(emitcnpj8_anon))) +
  labs(title = "Total de ICMS por mes - por emissor",
       x = "Mes",
       y = "ICMS (R$)") +
  scale_x_continuous(breaks = c(10,11,12)) +
  theme_classic() + 
  labs(color = "Emissor") +
  theme(legend.text = element_text(size = 7), # don't forget the comma!
        legend.title = element_text(size = 7), # don't forget the comma!
        plot.title = element_text(size = 9),
        axis.text.x=element_text(size=6)) 
  
# Exercise 2d
  ggsave("base_nfe_icms_emissor.png",
         width = 20,
         height = 10,
         units = "cm")

# Exercise 3a
df_month <- base_nfe %>%
  select(mes_emissao, vicms) %>%
  group_by(mes_emissao) %>%
  summarize(total = sum(vicms))

# Exercise 3b
ggplot(df_month) +
  aes(x = mes_emissao,
      y = total) +
  geom_col() +
  geom_text(aes(label = total),
            position = position_dodge(width = 1),
            vjust = -0.5,
            size = 3) +
  labs(title = "Total de ICMS por mes",
       x = "Mes",
       y = "Total ICMS") +
  scale_x_continuous(breaks = 201901:201912) +
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme_classic()

# Exercise 3c
ggplot(df_month) +
  aes(x = mes_emissao,
      y = total) +
  geom_col() +
  geom_text(aes(label = round(total)),        #<- Change goes here
            position = position_dodge(width = 1),
            vjust = -0.5,
            size = 3) +
  labs(title = "Total de ICMS por mes",
       x = "Mes",
       y = "Total ICMS") +
  scale_x_continuous(breaks = 201901:201912) +
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme_classic()

# Saving
ggsave("nfe_totals_text.png",
       width = 20,
       height = 10,
       units = "cm")

# Exercise 4
ggplot(base_nfe) +
  aes(x = vprod,
      y = vicms) +
  geom_point() +
  labs(title = "Relação entre ICMS e valor do produto",
       x = "Valor Produto (R$)",
       y = "Valor ICMS (R$)") +
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme_classic()

# Saving
  ggsave("scatter_icms_value.png",
         width = 20,
         height = 10,
         units = "cm")
  