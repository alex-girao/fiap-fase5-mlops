from flask import Flask, request
from joblib import load as load_joblib

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    try:
        frase = request.json["frase"]
        pipeline = load_joblib("models/sentiments.joblib")
        vector = pipeline.named_steps.vectorizer.transform([frase])
        response = pipeline.named_steps.model.predict(vector)
        return {"response-predict": response[0]}, 200
    except Exception as e:
        print(e)
        return {"error": "Falha ao tentar realizar a predição."}, 500