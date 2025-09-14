from flask import Flask, request
import socket 
import time

app = Flask(__name__)

hostname = socket.gethostname()

def burn_cpu(seconds=10):
    end = time.time() + seconds
    while time.time() < end:
        x = 0
        for i in range(10**6):
            x += i**2

@app.route("/")
def status():
    burn = request.args.get('burn')
    if burn:
        seconds = int(burn)
        burn_cpu(seconds)
        return f"Am consumat CPU timp de {seconds} secunde pe host {hostname}"
    else:
        return f"Salut din {hostname}"    



if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8123)
