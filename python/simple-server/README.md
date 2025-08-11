# Simple Python Port Listener

This is just used to make busy a specific port.

## How to run:

pip install -r requirements.txt

flask run --host=0.0.0.0 --port=8123

Open in Browser: http://localhost:8123/

## Docker Build and run 
docker build -t simple-server .
docker run -p 8123:80 -e APP_PORT=80 simple-server

## Docker compose
docker compose up