#Week 7:
#Correlation and Covariance:
# a)  Develop a program to find the correlation matrix on iris data.

data(iris)
numeric_data <- iris[, 1:4]
cor_matrix <- cor(numeric_data)
print("Correlation Matrix:")
print(cor_matrix)

# b) Plot the correlation plot on dataset and visualize giving an overview of relationships among data on iris data

install.packages("corrplot")
library(corrplot)
corrplot(cor_matrix, method = "color", type = "upper")

# c)Analysis of covariance: variance (ANOVA), if data have categorical variables on iris data
anova_result <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_result)
