# Instalação dos Pacotes

install.packages('readxl');
install.packages('data.table');
install.packages('dplyr');
install.packages('tidyr');
install.packages('lubridate');
install.packages('arulesCBA');
install.packages('ggplot2');
install.packages('reshape');
install.packages('rpivotTable');

library(readxl);
library(data.table);
library(dplyr);
library(tidyr);
library(lubridate);
library(arulesCBA);
library(ggplot2);
library(reshape);
library(rpivotTable);

A02 <- read_excel('./A02.xlsx');

# Exercicio 3
boxplot(A02$Quantity);
boxplot(A02$`Order Date`);

media_quantidade <- mean(A02$Quantity);
dp_quantidade <- sd(A02$Quantity);

## Dividido pelo numero de Regios(13)
erro_quantidade <- qnorm(0.975) * dp_quantidade/13;

li_quantidade <- media_quantidade - erro_quantidade;
ls_quantidade <- media_quantidade + erro_quantidade;

out_max_quantidade <- media_quantidade + 3 * dp_quantidade;
out_min_quantidade <- media_quantidade - 3 * dp_quantidade;

## Normalização

A02N <- A02 %>% filter(Quantity < out_max_quantidade & Quantity > out_min_quantidade) %>% select(Quantity, `Order Date`, Region, State);

boxplot(A02N$Quantity);

media_quantidade <- mean(A02N$Quantity);

dp_quantidade <- sd(A02N$Quantity);

erro_quantidade <- qnorm(0.975) * dp_quantidade/13;

li_quantidade <- media_quantidade - erro_quantidade;
ls_quantidade <- media_quantidade + erro_quantidade;

# Exercicio 4

A02Q <- A02N %>% group_by(State, Region) %>% summarise(media=mean(Quantity), qtd=n());

cor(A02Q[, 3:4]);
pairs(A02Q[, 3:4]);

boxplot(media ~ Region, data= A02Q, xlab = 'Regi�o', ylab = 'M�dia');
reg = lm(media ~ Region, data = A02Q);
summary(reg);
anova(reg);

State = factor(A02Q$State);
faixa_media = discretize(A02Q$media, method="cluster", breaks=5);
table(State, faixa_media);
chisq.test(table(State, faixa_media));

Region = factor(A02Q$Region);
faixa_media = discretize(A02Q$media, method="cluster", breaks=5);
table(Region, faixa_media);
chisq.test(table(Region, faixa_media));

A02N <- A02N %>% mutate(ano=year(`Order Date`));
A02N <- A02N %>% mutate(mes=month(`Order Date`));

# Exercicio 5

A02Reg <- A02N %>% group_by(ano, mes) %>% summarise(total = sum(Quantity));
setDT(A02Reg);
class(A02Reg);
A02Reg[,ano3 := ano - 2011];
A02Reg[,periodo := (ano3 * 12) + mes];

plot(total ~ periodo, data = A02Reg);

regressao <- lm(total ~ periodo, data = A02Reg);

A <- summary(regressao)$coefficients[1,1];
B <- summary(regressao)$coefficients[2,1];

A02Reg[,previsao := A + (periodo * B)];
plot(previsao ~ periodo, data=A02Reg);
lines(previsao ~ periodo, data=A02Reg);

# Exercicio 6
A02C <- A02N %>% group_by(Region) %>% summarise(media = mean(Quantity), qtde = n());
clusters <- hclust(dist(A02C[,2,3]));
clusterCut <- cutree(clusters, 3);
ggplot(A02C, aes(media, qtde, color = A02C$Region)) + geom_point(alpha = 0.4, size = 5.5) + geom_point(col = clustersCut);
plot(clusters, labels = A02C$Region);
table(A02C$Region, clustersCut);

# Exercicio 7

paisano <- cast(A02N, Region ~ ano);
clusters <- hclust(dist(paisano[, 2:4]));
clusterCut <- cutree(clusters, 3);
table(paisano$Region, clusterCut);

ggplot(paisano, aes(2011, 2012, color = paisano$Region)) + geom_point(alpha = 0.4, size = 5.5) + geom_point(col = clusterCut);
plot(clusters, labels=paisano$Region);
rpivotTable(A02N)
