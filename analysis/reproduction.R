# Reproduction scaffold based on the methodology documented in the 2019 project.
# This is NOT the original 2019 source code.
#
# Expected dataset: the common "Churn_Modelling.csv" bank churn dataset.
# The exact original random split/model specification was not preserved, so
# reproduced metrics may differ from the report's 79% accuracy / 47% recall / 49% precision.

set.seed(10905)

data <- read.csv("data/Churn_Modelling.csv", stringsAsFactors = FALSE)

# Remove identifiers documented as unnecessary for prediction.
drop_cols <- intersect(c("RowNumber", "CustomerId", "Surname"), names(data))
model_data <- data[, setdiff(names(data), drop_cols)]

# Convert common categorical fields to factors when present.
for (col in intersect(c("Geography", "Gender"), names(model_data))) {
  model_data[[col]] <- as.factor(model_data[[col]])
}

if (!"Exited" %in% names(model_data)) {
  stop("Expected target column 'Exited' was not found.")
}

# Reconstruct the original report's 4,907 / 5,093 train-test sizes.
train_idx <- sample(seq_len(nrow(model_data)), size = 4907)
train <- model_data[train_idx, ]
test  <- model_data[-train_idx, ]

# The surviving report says probabilities were calculated in R but does not
# preserve the exact model formula/code. Logistic regression is used here as a
# transparent modern reconstruction for a binary churn outcome.
model <- glm(Exited ~ ., data = train, family = binomial())

train_prob <- predict(model, newdata = train, type = "response")
test_prob  <- predict(model, newdata = test, type = "response")

threshold <- 0.50
train_pred <- ifelse(train_prob >= threshold, 1, 0)
test_pred  <- ifelse(test_prob >= threshold, 1, 0)

metrics <- function(actual, predicted) {
  tp <- sum(actual == 1 & predicted == 1)
  tn <- sum(actual == 0 & predicted == 0)
  fp <- sum(actual == 0 & predicted == 1)
  fn <- sum(actual == 1 & predicted == 0)

  accuracy  <- (tp + tn) / (tp + tn + fp + fn)
  precision <- ifelse(tp + fp == 0, NA, tp / (tp + fp))
  recall    <- ifelse(tp + fn == 0, NA, tp / (tp + fn))

  c(
    accuracy = accuracy,
    precision = precision,
    recall = recall,
    tp = tp,
    tn = tn,
    fp = fp,
    fn = fn
  )
}

cat("Training metrics:\n")
print(metrics(train$Exited, train_pred))

cat("\nTesting metrics:\n")
print(metrics(test$Exited, test_pred))

cat("\nObserved churn rate in full dataset:\n")
print(mean(model_data$Exited))

# Next step for a modern version:
# join predicted churn probability with offer cost, estimated customer value,
# and expected acceptance probability to calculate expected retention value.
