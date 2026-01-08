# Mushroom Classification Model

## Project Description
This project focuses on building a binary classification model to predict whether a mushroom is **edible** or **poisonous** using the H2O AutoML framework.

The dataset is based on descriptions of hypothetical samples corresponding to 23 species of gilled mushrooms from *The Audubon Society Field Guide to North American Mushrooms (1981)* and was modified for educational purposes.

---

## Dataset
- Target variable: `class`
  - `e` – edible
  - `p` – poisonous
- All features are categorical.

---

## Data Preprocessing
- Columns with only one unique value were removed.
- All categorical features were encoded using **label encoding** and converted to **factor** type.
- This approach preserves categorical nature without introducing artificial numeric ordering.

---

## Modeling Approach
- H2O AutoML was used to train multiple classification models.
- 10-fold cross-validation was applied.
- The best model was selected based on AUC.

---

## Threshold Selection
- The optimal classification threshold was selected by **maximizing the F1-score**.

---

## Evaluation Metrics
The final model achieved the following results:
- **Accuracy**: 1.00
- **AUC**: 1.00
- **GINI**: 1.00

These results indicate a very high separability of classes in the dataset.

---

## Tools & Libraries
- R
- H2O
- tidyverse
- skimr

---

## Author
Homework project for educational purposes.
