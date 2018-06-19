from flask import Flask
from flask import Flask, render_template
from redis import Redis
import os
import socket

app = Flask(__name__)
redis = Redis(host=os.environ['REDIS_HOST'], port=6379)
#redis = Redis(host='redis', port=6379)
hostname = socket.gethostbyaddr(socket.gethostname())[0]

@app.route('/')
def hello():
    count = redis.incr('hits')
    return render_template('index.html', counter=count);
    #return 'Hello World..... AND GOODBYE...hope to see you soon again!!! I have been seen {0} times, host is: {1}\n'.format(count,hostname)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=False)
