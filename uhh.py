import requests, json
from flask import Flask, request, make_response
from flask_cors import CORS
from urllib.parse import unquote

a = Flask(__name__)
CORS(a)

@a.route("/request")
def req():
    x=request.headers.get("headers")
    resp = requests.request(request.method,unquote(request.args["url"]),headers=json.loads(x if x!=None else "{}"),data=request.data if request.method.lower() in ["get","head"] else None)
    fresp = make_response(resp.content, resp.status_code)
    for i in resp.headers.items():
        fresp.headers.add(i[0],i[1])
    fresp.headers.add("Content-Encoding","utf-8")
    fresp.headers.remove("Transfer-Encoding")
    print(fresp.headers)
    return fresp 

@a.route("/")
def lailadigihao():
    return "yuiergbhnujiefgrwjibwrfgbhiwfebhuilwfebhuwefbhuwefbhu"

a.run(port=8072,debug=True)
