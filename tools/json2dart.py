"Typed maps, NOW!!"

import sys
name = sys.argv[1]
print(name)
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

isInvalidPropName = lambda k: any(k[0]==i for i in "0123456789") or any(i in k for i in "-/\\[]{}() *&^%#@!'\":;,?=÷×+|<>°•") or any(ord(i)>126 for i in k)
def boy(k,v,ld=False, toJson=False):
    global output
    t = type(v)
    nam = k[0].upper()+k[1:]
    if t == dict and not ld: #and not isInvalidPropName(k): 
        v["$toJson"] = toJson
        if "$schema" not in v: return generate(v,nam)
        else: 
            nam = cry(v['$schema'])
            mport = ('package:sofieru/json/ajax/' if v['$schema'].startswith('$/') else '')+v['$schema'].removeprefix("$/")
            if mport not in imported: 
                output=f"import '{mport}.dart' show {nam};"+"\n"+output
                imported.append(mport)
            return nam
    if type(v) == list: 
        if len(v) != 0 and type(v[0]) == dict and "$schema" in v[0]:
            nam = cry(v[0]['$schema'])
            mport = ('package:sofieru/json/ajax/' if v[0]['$schema'].startswith('$/') else '')+v[0]['$schema'].removeprefix("$/")
            if mport not in imported: 
                output=f"import '{mport}.dart' show {nam};"+"\n"+output
                imported.append(mport)
            return f"List<{nam}>"
        try: 
            if type(v[0])==dict: v[0]["$toJson"] = toJson
            return f"List<{generate(v[0],nam)}>"
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
    toJson = "  Map<String, dynamic> toJson() => <String,dynamic>{\n"
    # toJson = "" # we dont need toJson
    private = True
    optInToJson:bool = data.get("$toJson", False)

    emptiable = data.get("$emptiable",[])
    nullable = data.get("$nullable",[])
    desc: dict[str,str] = data.get("$desc",{})
    if "$this" in desc:
        out="/// "+"\n/// ".join(desc["$this"].splitlines())+"\n"+out
    g = emptiable+nullable
    if "$all" in emptiable: emptiable = list(data.keys())
    if "$all" in nullable: nullable = list(data.keys())

    for k,v in data.items():
        if k == "zoneConfig" or k.startswith("$"): continue
        vto = type(v)
        #b = (vto==list and len(v)==0)

        if isInvalidPropName(k):return f"Map<String, {boy(name.removeprefix('_')+'Content',v)}>"
        required = not (k in emptiable or k in nullable) #or b
        fnnuy = {"$schema":"$/shared/Placeholder"}
        # if k=="planTranslationTitle":breakpoint()
        vt=boy(k,v if not (k in emptiable and vto==list) else fnnuy if type(v)!=list else [fnnuy])
        if vt=="Null": 
            vt="String"
            required = False
        if k in desc:
            out+="  /// "+"\n  /// ".join(desc[k].splitlines())+"\n"
        if vt.startswith("Map<") and "-" in v.get("$nullable",[]): # pyright: ignore 
            vt=vt[:-1]+"?>"
        out+=f"  final {vt}{'' if required else '?'} {k};"+"\n"
        const+=f"    {'required ' if required else ''}this.{k},"+"\n"

        fromJson+=f"    {k}: json['{k}']"
        toJson+=f'    "{k}": {k}'
        if k in emptiable: fromJson+=f" is List?null:json['{k}']"
        if k in nullable: fromJson+=f" == null?null:json['{k}']"
        if vt.startswith("Map<"):
            # vt2 = vt.removeprefix('Map<String, ').removesuffix('>')
            fromJson=fromJson[:-8-len(k)]+f"(json['{k}'] as Map<String,dynamic>)"
        if k not in emptiable and (vto not in [list,dict]): 'fromJson+=f" as {vt}"'
        elif vto==list: 
            j = vt.removesuffix(">").removeprefix("List<") # we might not having to
            fromJson=fromJson[:-8-len(k)]+f"(json['{k}'] as List<dynamic>)"
            if j != "dynamic": 
                fromJson+=f".map((e)=>"+(f"{j}.fromJson(e)" if j not in classes.values() else f"e as {j}")+").toList()"
                if j not in classes.values(): 
                    if k in g: toJson+="?"
                    toJson+=".toJson()"
        else: 
            if vt.startswith("Map<"):
                vt2 = vt.removeprefix('Map<String, ').removesuffix('>').removesuffix("?")
                n = "-" in v.get("$nullable",[]) # pyright: ignore 
                # dart really just do a 🤫🧏 on type conversion lmao
                fromJson+=".map((k,v)=>MapEntry(k,"+("v==null?null:" if n else "")+(f"{vt2}.fromJson(v)" if vt2 not in classes.values() else f"v as {vt2}"+("?" if n else ""))+"))"
            else:
                fromJson=fromJson[:-8-len(k)]+f"{vt}.fromJson(json['{k}'])"
        fromJson+=",\n"
        toJson+=",\n"

    fromJson+="  );"
    toJson+="  };"
    const+="  });\n"
    out+=const+fromJson+"\n"
    if optInToJson: out+=toJson
    out+="\n}\n"

    if "$typedef" in data: 
        for k,v in data["$typedef"].items():
            out+=f"typedef {k}={v};"+"\n"
    output+=out+"\n"
    return name
    
generate(d, name)
open(name+".dart","w",encoding="utf-8").write(output)
