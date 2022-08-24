FROM python:3.8-slim-buster

WORKDIR /app

COPY models models
COPY resources resources
COPY scripts scripts
COPY endpoint.py endpoint.py
COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]