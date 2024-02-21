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

output = """"""
cry = lambda x: x.split("/")[-1]
def boy(k,v,ld=False):
    global output
    t = type(v)
    nam = k[0].upper()+k[1:]
    if t == dict and not ld and not (any(k[0]==i for i in "0123456789") or any(i in k for i in "-/\\[]{}() *&^%#@!'\":;,?=÷×+|<>°•")): 
        if "$schema" not in v: return generate(v,nam)
        else: 
            nam = cry(v['$schema'])
            output=f"import '{v['$schema']}.dart' show {nam};"+"\n"+output
            return nam
    if type(v) == list: 
        if len(v) != 0 and type(v[0]) == dict and "$schema" in v[0]:
            nam = cry(v[0]['$schema'])
            output=f"import '{'package:sofieru/json/' if v[0]['$schema'].startswith('./') else ''}{v[0]['$schema']}.dart' show {nam};"+"\n"+output
            return f"List<{nam}>"
        try: return f"List<{generate(v[0],nam)}>"
        except IndexError: return "List<dynamic>"
    else: return classes[str(t).split("'")[1]]
private = False
def generate(data, name=""):
    if type(data) != dict: return boy(name,data)
    global output, private
    if private: name = "_"+name
    if "$name" in data: name = data["$name"]
    out = "\n"+f"class {name} "+"{\n"
    const = f"  {name}("+"{\n"
    # This code is essentially not recommended, but since pixiv apis is built for javascript, i have no other choice
    # the way they check for whether the response contains data is via an empty string (i suppose, but i dont think they did it)
    fromJson = f"  static {name}? fromJson(dynamic json) "+"{\n    if (json is List) return null;\n"+f"    return {name}("+"\n"
    # toJson = f"Map<String, dynamic> toJson() => _${name2}ToJson(this);"
    toJson = "" # we dont need toJson
    private = True

    emptiable = data.get("$emptiable",[])
    nullable = data.get("$nullable",[])
    g = emptiable + nullable

    for k,v in data.items():
        if k == "zoneConfig" or k.startswith("$"): continue
        vto = type(v)
        b = (vto==list and len(v)==0)
        vt = boy(k,v if not b else {"schema":"package:sofieru/json/ajax/shared/Placeholder.dart"})

        if any(k[0]==i for i in "0123456789") or any(i in k for i in "-/\\[]{}() *&^%#@!'\":;,?=÷×+|<>°•"):return f"Map<String, {vt}>"
        required = vt!="Null" or (k in g) or b 
        if not required: vt="String"
        out+=f"  final {vt}{'' if required else '?'} {k};"+"\n"
        const+=f"    {'required ' if required else ''}this.{k},"+"\n"

        fromJson+=f"     {k}: json['{k}']"
        if k in emptiable: fromJson+=f" is List?null:json['{k}']"
        vt = vt+('' if required else '?')
        if k not in emptiable: fromJson+=f" as {vt}"
        elif vto==list: 
            j = vt[5:-1]
            if j not in classes.values(): fromJson+=f".map((e)=>{j}.fromJson(e)).toList()"
        else: fromJson+=f".map((k,v)=>MapEntry(k,{vt}))" if vt not in classes.values() else f" as Map<String, {vt}>"
        fromJson+=",\n"

    fromJson+="    );\n  }"
    const+="  });\n\n"
    out+=const+fromJson+"\n  "+toJson+"\n}\n"

    if "$typedef" in data: 
        for k,v in data["$typedef"].items():
            out+=f"typedef {k}={v};"+"\n"
    output+=out
    return name
    
generate(d, name)
open(name+".dart","w",encoding="utf-8").write(output)
