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

d: dict[str,Any] = json.load(open(sys.argv[2],encoding="utf-8"))

output = f"""import 'package:json_annotation/json_annotation.dart';
part '{name}.g.dart';
"""
cry = lambda x: x.split("/")[-1]
def boy(k,v,ld=False):
    global output
    t = type(v)
    nam = k[0].upper()+k[1:]
    if t == dict and not ld and not (any(k[0]==i for i in "0123456789") or any(i in k for i in "-/\\[]{}() *&^%#@!'\":;,?=÷×+|<>°•")): 
        if "schema" not in v: return generate(v,nam)
        else: 
            nam = cry(v['schema'])
            output=f"import '{v['schema']}.dart' show {nam};"+"\n"+output
            return nam
    if type(v) == list: 
        if len(v) != 0 and type(v[0]) == dict and "schema" in v[0]:
            nam = cry(v[0]['schema'])
            output=f"import '{v[0]['schema']}.dart' show {nam};"+"\n"+output
            return f"List<{nam}>"
        try: return f"List<{generate(v[0],nam)}>"
        except IndexError: return "List<dynamic>"
    else: return classes[str(t).split("'")[1]]
private = False
def generate(data, name=""):
    if type(data) != dict: return boy(name,data)
    global output, private
    name2 = name
    if private: name = "_"+name
    out = "\n@JsonSerializable()\n"+f"class {name} "+"{\n"
    const = f"  {name}("+"{\n"
    fromJson = f"  factory {name}.fromJson(Map<String, dynamic> json) => _${name2}FromJson(json);"
    # toJson = f"Map<String, dynamic> toJson() => _${name2}ToJson(this);"
    toJson = "" # we dont need toJson
    private = True
    for k,v in data.items():
        vt = boy(k,v)
        if any(k[0]==i for i in "0123456789") or any(i in k for i in "-/\\[]{}() *&^%#@!'\":;,?=÷×+|<>°•"):return f"Map<String, {vt}>"
        required = vt!="Null"
        if not required: vt="String"
        out+=f"  final {vt}{'' if required else '?'} {k};"+"\n"
        const+=f"    {'required ' if required else ''}this.{k},"+"\n"
    const+="  });\n\n"
    out+=const+fromJson+"\n  "+toJson+"\n}"
    output+=out
    return name
    
generate(d, name)
open(name+".dart","w",encoding="utf-8").write(output)
