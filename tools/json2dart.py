import sys
name = sys.argv[1]
import json
from typing import Any
classes = {
    "str": "String",
    "int": "int",
    "float": "double",
    "bool": "bool",
    "NoneType": "Null",
    "list": "List",
    "dict": "Map" # this never happens
}

d: dict[str,Any] = json.load(open(sys.argv[2]))["body"]

output = f"""
"""
def boy(k,v,ld=False):
    t = type(v)
    nam = k[0].upper()+k[1:]
    if t == dict and not ld: return generate(v,nam)
    if type(v) == list: 
        try: return f"List<{generate(v[0],nam)}>"
        except IndexError: return "List<dynamic>"
    else: return classes[str(t).split("'")[1]]

def generate(data, name=""):
    if type(data) != dict: return boy(name,data)
    global output
    out = "\n"+f"class {name} "+"{\n"
    const = f"  {name}("+"{\n"
    fromJson = f"  factory {name}.fromJson(Map<String, dynamic> json) => {name}("+"\n"
    toJson = f"Map<String, dynamic> {name}.toJson() => Map<String, dynamic>"+"{\n"
    for k,v in data.items():
        vt = boy(k+"_"+name,v)
        if any(k[0]==i for i in "0123456789") or any(i in k for i in "-/\\[]{}() *&^%#@!'\":;,?=÷×+|<>°•"):return f"Map<String, {vt}>"
        required = vt!="Null"
        if not required: vt="String"
        out+=f"  final {vt}{'' if required else '?'} {k};"+"\n"
        const+=f"    {'required ' if required else ''}this.{k},"+"\n"
        fromJson+=f'    {k}='+(f'{vt}.fromJson(json["{k}"])' if type(v) == dict and "Map" not in vt else f'json["{k}"]')+",\n"
        toJson+=f'    "{k}":'+f' this.{k}'+(("" if required else f"==null?null:this.{k}")+".toJson()" if type(v)==dict and "Map" not in vt else "")+",\n"
    const+="  });\n\n"
    fromJson+="  );\n"
    toJson+="  };\n"
    out+=const+fromJson+"\n  "+toJson+"\n}"
    output+=out
    return name
    
generate(d, name)
open(name+".dart","w").write(output)
