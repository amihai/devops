import os
import subprocess
import flask

app = flask.Flask(__name__)

@app.route('/run')
def run_command():
    cmd = flask.request.args.get('cmd')
    # execuție directă fără validare — RCE
    os.system(cmd)
    return 'Command executed'

@app.route('/ping')
def ping():
    # subprocess fără shell=False — potențial periculos
    host = flask.request.args.get('host')
    subprocess.call(f"ping -c 1 {host}", shell=True)
    return 'Ping sent'

if __name__ == '__main__':
    app.run()
