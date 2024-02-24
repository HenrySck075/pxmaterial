"Typed maps, NOW!!"

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
    "thats just dynamic let him free lil bro": "dynamic",
    "dict": "Map" # this never happens
}

d: dict[str,Any] = json.load(open(sys.argv[2],encoding="utf-8"))
imported = []
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
            mport = ('package:sofieru/json/' if v['$schema'].startswith('$/') else '')+v['$schema'].removeprefix("$/")
            if mport not in imported: 
                output=f"import '{mport}.dart' show {nam};"+"\n"+output
                imported.append(mport)
            return nam
    if type(v) == list: 
        if len(v) != 0 and type(v[0]) == dict and "$schema" in v[0]:
            nam = cry(v[0]['$schema'])
            mport = ('package:sofieru/json/' if v[0]['$schema'].startswith('$/') else '')+v[0]['$schema'].removeprefix("$/")
            if mport not in imported: 
                output=f"import '{mport}.dart' show {nam};"+"\n"+output
                imported.append(mport)
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
    if "$type" in data: return data["$type"]
    out = f"class {name} "+"{\n"
    const = f"  {name}("+"{\n"
    # This code is essentially not recommended, but since pixiv apis is built for javascript, i have no other choice
    # the way they check for whether the response contains data is via an empty string (i suppose, but i dont think they did it)
    fromJson = f"  factory {name}.fromJson(Map<String, dynamic> json) => {name}("+"\n"
    # toJson = f"Map<String, dynamic> toJson() => _${name2}ToJson(this);"
    toJson = "" # we dont need toJson
    private = True

    emptiable = data.get("$emptiable",[])
    nullable = data.get("$nullable",[])
    desc: dict[str,str] = data.get("$desc",{})
    if "$this" in desc:
        out="/// "+"\n/// ".join(desc["$this"].splitlines())+"\n"+out
    g = emptiable+nullable

    for k,v in data.items():
        if k == "zoneConfig" or k.startswith("$"): continue
        vto = type(v)
        #b = (vto==list and len(v)==0)

        if any(k[0]==i for i in "0123456789") or any(i in k for i in "-/\\[]{}() *&^%#@!'\":;,?=÷×+|<>°•"):return f"Map<String, {boy(name.removeprefix('_')+'Content',v)}>"
        required = not (k in emptiable or k in nullable) #or b
        if "$all" in g: required=False
        fnnuy = {"$schema":"$/ajax/shared/Placeholder"}
        vt=boy(k,v if not (k in emptiable and vto!=dict) else fnnuy if type(v)!=list else [fnnuy])
        if vt=="Null": 
            vt="String"
            required = False
        if k in desc:
            out+="  /// "+"\n  /// ".join(desc[k].splitlines())+"\n"
        out+=f"  final {vt}{'' if required else '?'} {k};"+"\n"
        const+=f"    {'required ' if required else ''}this.{k},"+"\n"

        fromJson+=f"    {k}: json['{k}']"
        if k in emptiable: fromJson+=f" is List?null:json['{k}']"
        if k not in emptiable and (vto not in [list,dict]): 'fromJson+=f" as {vt}"'
        elif vto==list: 
            j = vt.removesuffix(">").removeprefix("List<") # we might not having to
            if j not in classes.values(): fromJson+=f".map((e)=>{j}.fromJson(e)).toList()"
        else: 
            if vt.startswith("Map<"):
                vt2 = vt.removeprefix('Map<String, ').removesuffix('>')
                fromJson+=f".map((k,v)=>MapEntry(k as String,{vt2}.fromJson(v)))" if vt2 not in classes.values() else ""#f" as {vt+('' if required else '?')}"
            else:
                fromJson=fromJson[:-8-len(k)]+f"{vt}.fromJson(json['{k}'])"
        fromJson+=",\n"

    fromJson+="  );"
    const+="  });\n"
    out+=const+fromJson+"\n  "+toJson+"\n}\n"

    if "$typedef" in data: 
        for k,v in data["$typedef"].items():
            out+=f"typedef {k}={v};"+"\n"
    output+=out+"\n"
    return name
    
generate(d, name)
open(name+".dart","w",encoding="utf-8").write(output)
