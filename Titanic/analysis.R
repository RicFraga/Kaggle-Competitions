library(ggplot2)

df <- read.csv("~/Documents/TItanic/Data/train.csv")
nrow(df)
ncol(df)
names(df)

# Looking for NAs
summary(df)
sum(complete.cases(df))

# Let's impute these NA values
# I had an issue with the mice package, so I'm just gonna impute the NA values
# with the averages
age_mean <- mean(df$Age, na.rm = TRUE)
nas <- which(is.na(df[, 'Age']))
for(i in nas) {
  df[i, 'Age'] <- age_mean
}

summary(df)
sum(complete.cases(df))

table(df$Survived, df$Pclass)
first_s <- table(df$Survived, df$Pclass)[2, 1]
second_s <- table(df$Survived, df$Pclass)[2, 2]
third_s <- table(df$Survived, df$Pclass)[2, 3]

first_ds <- table(df$Survived, df$Pclass)[1, 1]
second_ds <- table(df$Survived, df$Pclass)[1, 2]
third_ds <- table(df$Survived, df$Pclass)[1, 3]

classes <- rep(c('first', 'second', 'third'), each = 2)
state <- rep(c('Survived', 'Deceased'), 3)

plot_df <- data.frame(classes, c(first_s, second_s, third_s,
                                 first_ds, second_ds, third_ds),
                      state)
names(plot_df) <- c('class', 'number', 'state')

ggplot(plot_df, aes(fill = state, x = class, y = number)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ggtitle('Survivor rate by passenger class')

ggplot(df, aes(x = Sex, y = Age)) + geom_boxplot(fill = c('#F15074', 
                                                          '#95A5AB')) +
  ggtitle('Sex distribution')


male_s <- table(df$Sex, df$Survived)[2, 2]
male_ds <- table(df$Sex, df$Survived)[2, 1]
female_s <- table(df$Sex, df$Survived)[1, 2]
female_ds <- table(df$Sex, df$Survived)[1, 1]

sex <- rep(c('Female', 'Male'), each = 2)
state <- rep(c('Survived', 'Deceased'), 2)
plot_df2 <- data.frame(c(female_s, female_ds, male_s, male_ds),
                       sex, state)
names(plot_df2) <- c('number', 'sex', 'state')

ggplot(plot_df2, aes(fill = state, x = sex, y = number)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ggtitle('Survivor rate by sex')

ggplot(df, aes(x = Survived, y = Age, group = Survived)) + 
  geom_boxplot(fill = c('#F15074', '#95A5AB')) +
  ggtitle('Survivor distribution by age')

ggplot(df, aes(x = Survived, y = Fare, group = Survived)) + 
  geom_boxplot(fill = c('#F15074', '#95A5AB')) + ylim(c(0, 300)) +
  ggtitle('Survivor distribution by fare')

# Survivor by family aboard
summary(df[, 'SibSp'])
table(df[, 'SibSp'])

table(df$SibSp, df$Survived)

sibsp0_s <- table(df$SibSp, df$Survived)[1, 2]
sibsp0_d <- table(df$SibSp, df$Survived)[1, 1]
sibsp1_s <- table(df$SibSp, df$Survived)[2, 2]
sibsp1_d <- table(df$SibSp, df$Survived)[2, 1]
sibsp2_s <- table(df$SibSp, df$Survived)[3, 2]
sibsp2_d <- table(df$SibSp, df$Survived)[3, 1]
sibsp3_s <- table(df$SibSp, df$Survived)[4, 2]
sibsp3_d <- table(df$SibSp, df$Survived)[4, 1]
sibsp4_s <- table(df$SibSp, df$Survived)[5, 2]
sibsp4_d <- table(df$SibSp, df$Survived)[5, 1]
sibsp5_s <- table(df$SibSp, df$Survived)[6, 2]
sibsp5_d <- table(df$SibSp, df$Survived)[6, 1]
sibsp8_s <- table(df$SibSp, df$Survived)[7, 2]
sibsp8_d <- table(df$SibSp, df$Survived)[7, 1]

states <- rep(c('Survived', 'Deceased'), 7)
id <- rep(c(0,1,2,3,4,5,8), each = 2)

plot_df3 <- data.frame(id, c(sibsp0_s, sibsp0_d,
                            sibsp1_s, sibsp1_d,
                            sibsp2_s, sibsp2_d,
                            sibsp3_s, sibsp3_d,
                            sibsp4_s, sibsp4_d,
                            sibsp5_s, sibsp5_d,
                            sibsp8_s, sibsp8_d),
                      states)

names(plot_df3) <- c('sibsp', 'amount', 'state')

ggplot(plot_df3, aes(x = sibsp, y = amount, fill = state)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ggtitle('Survivor rate by SibSp')

# Better with percentiles
psibsp0_s <- (sibsp0_s * 100) / (sibsp0_d + sibsp0_s)
psibsp0_d <- 100 - psibsp0_s
psibsp1_s <- (sibsp1_s * 100) / (sibsp1_d + sibsp1_s)
psibsp1_d <- 100 - psibsp1_s
psibsp2_s <- (sibsp2_s * 100) / (sibsp2_d + sibsp2_s)
psibsp2_d <- 100 - psibsp2_s
psibsp3_s <- (sibsp3_s * 100) / (sibsp3_d + sibsp3_s)
psibsp3_d <- 100 - psibsp3_s
psibsp4_s <- (sibsp4_s * 100) / (sibsp4_d + sibsp4_s)
psibsp4_d <- 100 - psibsp4_s
psibsp5_s <- (sibsp5_s * 100) / (sibsp5_d + sibsp5_s)
psibsp5_d <- 100 - psibsp5_s
psibsp8_s <- (sibsp8_s * 100) / (sibsp8_d + sibsp8_s)
psibsp8_d <- 100 - psibsp8_s

states <- rep(c('Survived', 'Deceased'), 7)
id <- rep(c(0,1,2,3,4,5,8), each = 2)

plot_df4 <- data.frame(id, c(psibsp0_s, psibsp0_d,
                             psibsp1_s, psibsp1_d,
                             psibsp2_s, psibsp2_d,
                             psibsp3_s, psibsp3_d,
                             psibsp4_s, psibsp4_d,
                             psibsp5_s, psibsp5_d,
                             psibsp8_s, psibsp8_d),
                       states)

names(plot_df4) <- c('sibsp', 'percentage', 'state')

ggplot(plot_df4, aes(x = sibsp, y = percentage, fill = state)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ggtitle('Survivor rate by SibSp (Percentages)')

table(df$Parch, df$Survived)

parch0_s <- table(df$Parch, df$Survived)[1, 2]
parch0_d <- table(df$Parch, df$Survived)[1, 1]
parch1_s <- table(df$Parch, df$Survived)[2, 2]
parch1_d <- table(df$Parch, df$Survived)[2, 1]
parch2_s <- table(df$Parch, df$Survived)[3, 2]
parch2_d <- table(df$Parch, df$Survived)[3, 1]
parch3_s <- table(df$Parch, df$Survived)[4, 2]
parch3_d <- table(df$Parch, df$Survived)[4, 1]
parch4_s <- table(df$Parch, df$Survived)[5, 2]
parch4_d <- table(df$Parch, df$Survived)[5, 1]
parch5_s <- table(df$Parch, df$Survived)[6, 2]
parch5_d <- table(df$Parch, df$Survived)[6, 1]
parch6_s <- table(df$Parch, df$Survived)[7, 2]
parch6_d <- table(df$Parch, df$Survived)[7, 1]

states <- rep(c('Survived', 'Deceased'), 7)

plot_df5 <- data.frame(id, states,
                       c(parch0_s, parch0_d,
                         parch1_s, parch1_d,
                         parch2_s, parch2_d,
                         parch3_s, parch3_d,
                         parch4_s, parch4_d,
                         parch5_s, parch5_d,
                         parch6_s, parch6_d))

names(plot_df5) <- c('parch', 'states', 'amount')

ggplot(plot_df5, aes(x = id, y = amount, fill = states)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ggtitle('Survivor rate by Parch')

df <- df[-62, ]
df <- df[-829, ]

table(df$Embarked, df$Survived)[1, 2]
c_s <- table(df$Embarked, df$Survived)[2, 2]
c_d <- table(df$Embarked, df$Survived)[2, 1]
q_s <- table(df$Embarked, df$Survived)[3, 2]
q_d <- table(df$Embarked, df$Survived)[3, 1]
s_s <- table(df$Embarked, df$Survived)[4, 2]
s_d <- table(df$Embarked, df$Survived)[4, 1]

id <- rep(c('C', 'Q', 'S'), each = 2)
states <- rep(c('Survived', 'Deceased'), 3)

plot_df6 <- data.frame(id, states, c(
  c_s, c_d,
  q_s, q_d,
  s_s, s_d
))

names(plot_df6) <- c('id', 'state', 'amount')

ggplot(plot_df6, aes(x = id, y = amount, fill = state)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ggtitle('Survivor rate by Embarked')

# KNN
# Encoding sex and embarked
library(class)
library(mltools)

df$Sex <- ifelse(df$Sex == 'male', 0, 1)

new_emb <- c()
for(i in 1:nrow(df)) {
  if(df[i, 'Embarked'] == 'C')
    new_emb <- c(new_emb, 1)
  
  else if(df[i, 'Embarked'] == 'Q')
    new_emb <- c(new_emb, 2)
  
  else
    new_emb <- c(new_emb, 3)
}

df$Embarked <- new_emb

# Creating test and training sets
rows <- nrow(df)
partition <- floor(rows * 0.9)

training <- df[1:partition, ]
test <- df[(partition + 1):rows, ]

features <- c('Pclass', 'Sex', 'SibSp', 'Parch', 'Fare', 
              'Embarked', 'Age')

X_train <- training[, features]
y_train <- training[, 'Survived']

X_test <- test[, features]
y_test <- test[, 'Survived']

# fitting the model
accs <- c()
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
max_k <- 30

for (i in 1:max_k) {
  model_knn <- knn(X_train, X_test, cl = y_train, k = i)
  conf_mat <- table(model_knn, y_test)
  accs <- c(accs, accuracy(conf_mat))
}

plot_df7 <- data.frame(accs, 1:max_k)
names(plot_df7) <- c('accuracy', 'k')

ggplot(plot_df7, aes(x = k, y = accuracy)) +
  geom_line(color = "#21AF32") +
  ggtitle('Accuracy vs K')

# Generate outputs
test <- read.csv('~/Documents/TItanic/Data/test.csv')
summary(test)
nrow(test)

age_mean <- mean(test$Age, na.rm = TRUE)
nas <- which(is.na(test[, 'Age']))
for(i in nas) {
  test[i, 'Age'] <- age_mean
}

fare_mean <- mean(test$Fare, na.rm = TRUE)
nas <- which(is.na(test[, 'Fare']))
for(i in nas) {
  test[i, 'Fare'] <- fare_mean
}

summary(test)

test$Sex <- ifelse(test$Sex == 'male', 0, 1)

new_emb <- c()
for(i in 1:nrow(test)) {
  if(test[i, 'Embarked'] == 'C')
    new_emb <- c(new_emb, 1)
  
  else if(test[i, 'Embarked'] == 'Q')
    new_emb <- c(new_emb, 2)
  
  else
    new_emb <- c(new_emb, 3)
}

test$Embarked <- new_emb
X_train <- df[, features]
y_train <- df[, 'Survived']
X_test <- test[, features]

model_knn <- knn(X_train, X_test, cl = y_train, k = 9)

subm <- data.frame(892:1309, model_knn)
names(subm) <- c('PassengerId', 'Survived')
write.csv(subm, file = '~/Documents/TItanic/Data/submission.csv',
          row.names = FALSE)

?write.csv2

