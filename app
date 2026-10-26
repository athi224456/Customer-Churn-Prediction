import os, sys, json
from flask import Flask, render_template, request, jsonify
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "src"))
from predict import predict

app = Flask(__name__)
FIELDS = ["gender", "SeniorCitizen", "Partner", "Dependents", "tenure", "PhoneService", "MultipleLines",
          "InternetService", "OnlineSecurity", "OnlineBackup", "DeviceProtection", "TechSupport",
          "StreamingTV", "StreamingMovies", "Contract", "PaperlessBilling", "PaymentMethod",
          "MonthlyCharges", "TotalCharges"]

@app.route("/")
def index():
    m = json.load(open(os.path.join(ROOT, "outputs", "metrics.json")))
    return render_template("index.html", metrics=m)

@app.route("/predict", methods=["POST"])
def do_predict():
    rec = {f: request.form.get(f) for f in FIELDS}
    for f in ("tenure", "MonthlyCharges", "TotalCharges"): rec[f] = float(rec[f] or 0)
    p, label, risk = predict(rec)
    return jsonify(probability=round(p * 100, 1), label=label, risk=risk)

if __name__ == "__main__":
    app.run(debug=True, port=5000)
