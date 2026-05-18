import numpy as np
import pandas as pd
from pysr import PySRRegressor

# Load data
data = pd.read_csv('data.csv')
X = data[['s', 'N', 'a']].values
y_neg = data['ratio_neg'].values
y_pos = data['ratio_pos'].values

# =======================
# Negative Model
# =======================
model_neg = PySRRegressor(
    niterations=100,
    binary_operators=["+", "-", "*", "/", "pow"],
    unary_operators=["sqrt", "log", "exp"],
    constraints={'^': (-1, 1)},
    elementwise_loss="L1DistLoss()",

    #model_selection="best",
    #random_state=42,
    #warm_start=True,
)
model_neg.fit(X, y_neg)
print("Best fit of negative error:")
print(model_neg.sympy())
print("Expression:", model_neg.get_best().equation)

# =======================
# Positive Model
# =======================
model_pos = PySRRegressor(
    niterations=100,
    binary_operators=["+", "-", "*", "/", "pow"],
    unary_operators=["sqrt", "log", "exp"],
    constraints={'^': (-1, 1)},
    elementwise_loss="L1DistLoss()",

    #model_selection="best",
    #random_state=42,
    #warm_start=True,
)
model_pos.fit(X, y_pos)
print("\nBest fit of positive error:")
print(model_pos.sympy())
print("Expression:", model_pos.get_best().equation)


