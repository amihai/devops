FROM python:slim

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

ENV APP_HOST=0.0.0.0
ENV APP_PORT=8123

# IN productie folosim gunicorn sau uvicorn ca si application server
CMD ["sh", "-c", "flask run --host=$APP_HOST --port=$APP_PORT"]
