FROM python:3.10-slim-buster

WORKDIR /app

# variaveis virtuais
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# instalando dependencias
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
ENV FLASK_APP="endpoint"
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

EXPOSE 5000/tcp
