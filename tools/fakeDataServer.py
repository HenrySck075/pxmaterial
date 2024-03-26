"h"

from flask import Flask
import os 

a = Flask("__main__")

def schema_process(data):...
paths = {}
for root, dirs, files in os.listdir("payloads"):
    if root == "payloads": continue 
    if len(files)!=0: paths.update({root+"/"+i: open(root+"/"+i).read() for i in files})


a.route("/top/illust")
