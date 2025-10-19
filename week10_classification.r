#Week 10: Classification Model:
#a) Install relevant package for classification
install.packages(c("rpart", "randomForest"))
library(rpart)
library(randomForest)

#b) Implement and evaluate the performance of various classifiers with different datasets.

data(iris)
set.seed(123)

sample_index <- sample(1:nrow(iris), 0.7 * nrow(iris))
train <- iris[sample_index, ]
test  <- iris[-sample_index, ]

# -------------------------------
# 1️⃣ Decision Tree
# -------------------------------
dt_model <- rpart(Species ~ ., data = train, method = "class")
dt_pred <- predict(dt_model, test, type = "class")

# Accuracy
dt_acc <- sum(dt_pred == test$Species) / nrow(test)
cat("Decision Tree Accuracy:", round(dt_acc * 100, 2), "%\n")

# -------------------------------
# 2️⃣ Random Forest
# -------------------------------
rf_model <- randomForest(Species ~ ., data = train)
rf_pred <- predict(rf_model, test)

# Accuracy
rf_acc <- sum(rf_pred == test$Species) / nrow(test)
cat("Random Forest Accuracy:", round(rf_acc * 100, 2), "%\n")

# -------------------------------
# Accuracy Comparison
# -------------------------------
accuracy_table <- data.frame(
  Model = c("Decision Tree", "Random Forest"),
  Accuracy = c(dt_acc, rf_acc)
)

print("\nModel Accuracy Comparison:")
print(accuracy_table)
