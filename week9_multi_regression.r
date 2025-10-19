#Week 9: Multiple Regression Model:
#a) Develop Multiple Regression model for any dataset.

data(mtcars)
head(mtcars)

multi_model <- lm(mpg ~ wt + hp + cyl, data = mtcars)

summary(multi_model)


#b) Apply Multiple Regression Model to predict the data on any dataset.

new_car <- data.frame(wt = 2.8, hp = 120, cyl = 4)


predicted_mpg <- predict(multi_model, newdata = new_car)


cat("Predicted MPG for new car:\n")
print(predicted_mpg)
