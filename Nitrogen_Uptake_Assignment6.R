n_data <- read.csv(file.choose())

upplant_mean <- aggregate(upplant~sp*temp, data=n_data, FUN=mean)
anova(lm(srl~sp*temp, data=n_data))