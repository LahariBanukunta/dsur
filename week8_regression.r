#Regression Model:
#a) Import a data from web storage. Name the dataset and now do Logistic Regression to find out relation between variables that are affecting the admission of a student in an institute based on his or her GRE score, GPA obtained and rank of the student. Also check the model is fit or not. Require (foreign), require (MASS).
url <- "https://stats.idre.ucla.edu/stat/data/binary.csv"
admission <- read.csv(url)
admission$rank <- factor(admission$rank)
log_model <- glm(admit ~ gre + gpa + rank, data = admission, family = binomial)
summary(log_model)
admission$predicted <- predict(log_model, type = "response")
admission$pred_class <- ifelse(admission$predicted > 0.5, 1, 0)
conf_matrix <- table(Predicted = admission$pred_class, Actual = admission$admit)
print(conf_matrix)
cat("Model Accuracy:", round(mean(admission$pred_class == admission$admit) * 100, 2), "%\n")


#b) Apply regression Model to predict the data on any dataset

data(mtcars)
head(mtcars)


lin_model <- lm(mpg ~ hp + wt + cyl, data = mtcars)
summary(lin_model)

new_car <- data.frame(hp = 120, wt = 2.8, cyl = 4)
predicted_mpg <- predict(lin_model, newdata = new_car)

cat("Predicted MPG for new car:\n")
print(predicted_mpg)

