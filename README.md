Customer Churn Prediction
Machine-learning project that predicts whether a telecom customer will leave (churn), with a web app for live predictions.
Features
Data generator (synthetic Telco dataset, 7,000 customers) or use the real Kaggle Telco Customer Churn CSV
Preprocessing pipeline (imputation, scaling, one-hot encoding)
3 models compared: Logistic Regression, Random Forest, Gradient Boosting (5-fold CV + test metrics)
Auto-saves best model, metrics (JSON) and plots (confusion matrix, ROC, feature importance, EDA)
Flask web app: enter customer details, get churn probability + risk level
Structure
```
data/generate_data.py   create data/telco_churn.csv
src/preprocess.py       cleaning + ColumnTransformer
src/train.py            training, evaluation, plots
src/predict.py          load model and predict one customer
app/app.py              Flask app (templates/index.html)
models/  outputs/       saved model, metrics.json, charts
```
Run
```bash
python -m venv venv
venv\Scripts\activate            # Windows  (Linux/Mac: source venv/bin/activate)
pip install -r requirements.txt
python data/generate_data.py     # create dataset
python src/train.py              # train + evaluate + save model
python app/app.py                # open http://127.0.0.1:5000
```
Using the real Kaggle dataset
Download `WA_Fn-UseC_-Telco-Customer-Churn.csv`, rename it to `data/telco_churn.csv`, then run `python src/train.py`. Column names are identical.
Tech stack
Python, pandas, NumPy, scikit-learn, Matplotlib, Flask, HTML/CSS/JS
