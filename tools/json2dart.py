name = __import__("sys").argv[1]
import json
from typing import Any
classes = {
    "str": "String",
    "int": "int",
    "float": "double",
    "bool": "bool",
    "list": "List",
    "dict": "Map" # this never happens
}

d: dict[str,Any] = json.loads(input())

output = f"""
import 'package:json_annotation/json_annotation.dart';
part '{name}.g.dart';
"""

def generate(data: dict[str,Any], name=""):
    out = f"class {name} "+"{\n"
    const = f"  {name}("+"\n"
    for k,v in data.items():
        t = type(v)
        if t == dict: 
            vt=generate(v,k[0].upper()+k[1:])
        else: vt=classes[str(t).split("'")[1]]
        out+=f"  final {vt}? {k};"+"\n"
        const+=f"    this.{k},"+"\n"
    const+="  );\n\n"
    out+=const+f"  factory {name}.fromJson(Map<String, dynamic> json) => _${name}FromJson(json);"+"\n  "+f"Map<String, dynamic> {name}.toJson() => _${name}ToJson(this);"+"\n}"
    return name
    
