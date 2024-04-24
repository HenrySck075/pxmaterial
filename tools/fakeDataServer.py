"h"

from collections.abc import Callable
from typing import Any, ParamSpec, TypeVar
from flask import Flask
import json
import os, random
from string import ascii_lowercase, ascii_uppercase 
ascii_h = list(ascii_uppercase+ascii_lowercase )

def random_str():
    random.shuffle(ascii_h)
    return "".join(ascii_h[:8])

a = Flask("__main__")
P = ParamSpec("P")
R = TypeVar("R", contravariant=True)
def cache_return(f: Callable[P, R])->Callable[P,R]:
    the:dict[tuple,R] = {}
    def inner(*args)->R:
        for i in the.keys():
            if i[0] == args: return the[i]
        ret = f(*args)
        the[args] = ret 
        return ret 
    return inner # type: ignore # shut
cached_normpath = cache_return(os.path.normpath)
cached_join = cache_return(os.path.join)

def resolve(path, schema:str):
    if schema.startswith("$"): return schema.replace("$","")
    return cached_normpath(cached_join("/",path,schema))
repeat = 7
def schema_process_beta_mix(data: dict[str, Any],path,level=0)->dict[str,Any]:
    if "$copy" in data or "$extends" in data:
        resolved_schema = resolve(path,data.get("$copy",data["$extends"]))
        data = data | paths[resolved_schema]
    if "$schema" in data:
        resolved_schema = resolve(path,data["$schema"])
        return paths[resolved_schema]
    for k,v in data.items():
        print("  "*level+k)
        if type(v) == dict: 
            if "-" in v: 
                r = schema_process(v["-"],path,level+1)
                q = []
                for _ in range(repeat):
                    q.append(random_str())
                data[k] = {i:r for i in q}
            else: 
                data[k] = schema_process(v,path,level+1)
        if type(v) == list:
            if len(v)!=0 and type(v[0]) == dict and any(i.startswith("$") for i in v[0].keys()):
                r = schema_process(v[0],path,level+1)
                data[k] = [r]*repeat
    e = list(data.keys())
    for i in e:
        if i.startswith("$"): del data[i]
    return data
schema_process = schema_process_beta_mix
schema_process_2 = cache_return(lambda content, path: schema_process(json.loads(content),path))
paths: dict[str,dict] = {}
for root, dirs, files in os.walk("payloads/ajax"):
    if root == "payloads/ajax": continue 
    if len(files)!=0: paths.update({os.path.join(root[13:],i): json.load(open(root+"/"+i)) for i in files})

@a.route("/top/illust")
def yada(): return schema_process_2(json.dumps(paths["/top/illust/IllustTop"]),"top/illust")

@a.route("/illust/<id>")
def bau(id): return schema_process_2(json.dumps(paths["/illust/Artwork"]),"illust")

a.run(port=8000)
