# Exercicio 2
x1 <- 100
x2 <- 50
x3 <- x1 + x2
print(x3)

# Exercicio 4
#Alternativa de carregar dados
#base_nfe <- read.csv('/Users/tscot/Downloads/Treinamento_SEFAZ/base_nfe.csv')

base_outubro <- subset(base_nfe,
                   mes_emissao == 10)
View(base_outubro)
  
# Exercicio 5 (Vetores)
v1 <- c(3, 8, 10)
v2 <- c(7, 2, 5)
result1 <- v1 + v2
result2 <- v2 + 10
print(result1)
print(result2)

# Exercicio 6
summary_table <- summary(base_nfe)
print(summary_table)
