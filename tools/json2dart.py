"You should add typed maps NOW!!"

from os.path import join, normpath, dirname
import sys,os,subprocess
name = sys.argv[1]
nameo = name
import json, re
from typing import Any
from mergedeep import merge, Strategy
classes = {
    "str": "String",
    "int": "int",
    "float": "double",
    "bool": "bool",
    "NoneType": "Null",
    "list": "List",
    "__main__.dynamic": "dynamic",
    "dict": "Map" # this never happens
}
class dynamic:
    def __str__(self) -> str:
        return "dynamic"
    def __repr__(self) -> str:
        return "dynamic"
    
path = sys.argv[2]
useStdin = path=="-"
d: dict[str,Any] = json.loads(open(path,encoding="utf-8").read() if not useStdin else input())
if d.get("$skip",False): exit()
if not useStdin:
    cachePath = os.path.join(".cache",path)
    if os.path.exists(cachePath) and json.load(open(cachePath,encoding="utf-8")) == d: 
        exit()

imported = []
output = """"""
cry = lambda x: x.split("/")[-1]

bed = re.compile("class ([a-zA-Z|_]*) {(.*)}",re.S|re.M)

def _purgeUnusedClasses(file: str):
    ret = file
    for c in bed.finditer(file):
        print(c.group(1))
        fileR = ret.replace(c.group(),"")
        "the one with the class removed"
        className = c.group(1)
        if className == name: continue

        if className not in fileR:
            ret = fileR

    return ret

def purgeUnusedClasses(f): 
    "TODO: actual code is above this"
    return f

def pathparse(pat:str, start:str):
    return (start if pat.startswith('$/') else '')+(normpath(join(dirname(path),pat)).replace("payloads/ajax/",start) if not useStdin and not pat.startswith('$/') else pat.removeprefix("$/"))
def tryimport(mport, nam): 
    global output
    if mport not in imported: 
        output=f"import '{mport}.dart' show {nam};"+"\n"+output
        imported.append(mport)
isInvalidPropName = lambda k: any(k[0]==i for i in "0123456789") or any(i in k for i in "-/\\[]{}() *&^%#@!'\":;,?=÷×+|<>°•") or any(ord(i)>126 for i in k)
def boy(k,v,ld=False):
    global output
    t = type(v)
    nam = k[0].upper()+k[1:]
    if t == dict and not ld: #and not isInvalidPropName(k): 
        if "$schema" not in v: return generate(v,nam)
        else: 
            nam = v.get("$useType") or cry(v['$schema'])
            tryimport(pathparse(v['$schema'],'package:sofieru/json/ajax/'),nam)
            return nam
    if type(v) == list: 
        if len(v) != 0 and type(v[0]) == dict and "$schema" in v[0]:
            nam = v[0].get("$useType") or cry(v[0]['$schema'])
            tryimport(pathparse(v[0]['$schema'],'package:sofieru/json/ajax/'),nam)
            return f"List<{nam}>"
        try: 
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
    doExtends = "$extends" in data
    copyStruct = data.get("$copy", data.get("$extends",""))
    supers=[]
    extends = ""
    out = f"class {name} "

    checkFalsy = data.get("$checkFalsy",[])
    nullable = data.get("$nullable",[])
    defaults = data.get("$defaultValues",{})
    # delete null values since we dont need it 
    # might still need checkFalsy tho
    for i in defaults.keys():
        if i in nullable: del nullable[nullable.index(i)]

    desc: dict[str,str] = data.get("$desc",{})
    b = "import 'package:sofieru/json/base.dart' show checkFalsy;"
    if "$this" in desc:
        out="/// "+"\n/// ".join(desc["$this"].splitlines())+"\n"+out
    g = checkFalsy+nullable
    if "$all" in checkFalsy: checkFalsy = list(data.keys())
    if "$all" in nullable: nullable = list(data.keys())
    c:dict = {}
    def copyStructFunc():
        nonlocal copyStruct, data, c
        c = json.load(open(pathparse(copyStruct,"./payloads/ajax/")))
        merge(data,c,strategy=Strategy.ADDITIVE) 
        nullable.extend(c.get("$nullable",[]))
        checkFalsy.extend(c.get("$checkFalsy",[]))
        if data.get("$copy") != None and data["$copy"] != copyStruct:
            copyStruct = data["$copy"]
            copyStructFunc()
    if copyStruct != "":
        copyStructFunc()
    if doExtends: 
        extends = cry(data["$extends"])
        supers = list(c.keys())
        tryimport(pathparse(data['$extends'],'package:sofieru/json/ajax/'),extends)
        #checkFalsy.extend(c.get("$checkFalsy",[]))
        f = cry(data['$extends'])
        subprocess.run(os.environ.get("interpreter",sys.executable)+f" json2dart.py {f} -",shell=True,input=json.dumps(c).encode())
        pat = os.path.dirname(pathparse(data['$extends'],"json/ajax/"))

        the = lambda: os.system(f"mv {f}.dart {os.path.join(pat,f)}.dart")
        ret = the() 
        if ret == 256: # assuming were cooking in linux
            os.system("mkdir -p "+pat)
            the()
        

    if doExtends: out+=f"extends {extends} "
    out += "{\n"
    const = f"  {name}("+"{\n"
    # This code is essentially not recommended, but since pixiv apis is built for javascript, i have no other choice
    # the way they check for whether the response contains data is via an empty string (i suppose, but i dont think they did it)
    fromJson=""
    if doExtends: fromJson+="  @override\n"
    fromJson += f"  factory {name}.fromJson(Map<String, dynamic> json) "+"{\n"
    if doExtends: fromJson+=f"    final parent = {extends}.fromJson(json);"+"\n"
    fromJson+=f"    return {name}("+"\n"
    toJson=""
    if doExtends: toJson="  @override\n"
    toJson += "  Map<String, dynamic> toJson() => "
    if doExtends: toJson+="super.toJson()..addAll("
    toJson+="<String,dynamic>{\n"
    # toJson = "" # we dont need toJson
    typedefs = data.get("$typedef",{})
    private = True

    for k,v in data.items():
        if k == "zoneConfig" or k.startswith("$"): continue
        vto = type(v)
        #b = (vto==list and len(v)==0)

        if isInvalidPropName(k):return f"Map<String, {boy(name.removeprefix('_')+'Content',v)}>"
        required = not (k in checkFalsy or k in nullable) #or b
        # fnnuy = {"$schema":"$/shared/Placeholder"}
        fnnuy = dynamic()
        # if k=="planTranslationTitle":breakpoint()
        const+=f"    {'' if k in defaults else 'required ' if required else ''}"
        toJson+=f'    "{k}": {k}'
        if k in supers: 
            fromJson+=f"    {k}: parent.{k}"
            const+=f"super.{k}"
        else:
            vt=boy(k,v if not (k in checkFalsy and len(v)!=0 and vto == list and v[0]==dict) else fnnuy if type(v)!=list else [fnnuy])
            if vt=="Null": 
                vt="String"
                required = False
            if vt.startswith("Map<") and "-" in v.get("$nullable",[]): # pyright: ignore 
                vt=vt[:-1]+"?>"
            if k in desc:
                out+="  /// "+"\n  /// ".join(desc[k].splitlines())+"\n"
            out+=f"  final {vt}{'' if required else '?'} {k};"+"\n"
            const+=f"this.{k}"


            fromJson+=f"    {k}: json['{k}']"
            if k in checkFalsy: fromJson=fromJson[:-8-len(k)]+f"checkFalsy(json['{k}'])?null:json['{k}']"
            if k in nullable: fromJson+=f" == null?null:json['{k}']"
            if vt.startswith("Map<"):
                # vt2 = vt.removeprefix('Map<String, ').removesuffix('>')
                fromJson=fromJson[:-8-len(k)]+f"(json['{k}'] as Map<String,dynamic>)"
            if (vto is dict or vto is list) and k in g: toJson+="?"
            if k not in checkFalsy and (vto not in [list,dict]): 'fromJson+=f" as {vt}"'
            elif vto==list: 
                j = vt.removesuffix(">").removeprefix("List<") # we might not having to
                fromJson=fromJson[:-8-len(k)]+f"(json['{k}'] as List<dynamic>)"
                if j != "dynamic": 
                    fromJson+=f".map((e)=>"+(f"{j}.fromJson(e)" if j not in classes.values() else f"e as {j}")+").toList()"
                    toJson+=".map((e)=>e.toJson()).toList()" if j not in classes.values() else "" 
            else: 
                if vt.startswith("Map<"):
                    vt2 = vt.removeprefix('Map<String, ').removesuffix('>').removesuffix("?")
                    n = "-" in v.get("$nullable",[]) # pyright: ignore 
                    # dart really just do a 🤫🧏 on type conversion lmao
                    fromJson+=".map((k,v)=>MapEntry(k,"+("v==null?null:" if n else "")+(f"{vt2}.fromJson(v)" if vt2 not in classes.values() else f"v as {vt2}"+("?" if n else ""))+"))"
                    toJson+=".map((k,v)=>MapEntry(k,"+("v==null?null:" if n else "")+("v.toJson()" if vt2 not in classes.values() else f"v as {vt2}"+("?" if n else ""))+"))"
                else:
                    fromJson=fromJson[:-8-len(k)]
                    if vt not in ["String", "int","bool","double"]:
                        fromJson+=f"{vt}.fromJson(json['{k}'])"
                        toJson+=".toJson()"
                    else: fromJson+=f"json['{k}'] as {vt}"
            if vto==list:
                j = vt.removesuffix(">").removeprefix("List<") # we might not having to

        if k in defaults: 
            const+= " = "+repr(defaults[k])
        const+=",\n"
        fromJson+=",\n"
        fromJson = fromJson.replace(f"json['{k}'] == null?null:json['{k}']", f"json['{k}']")
        toJson+=",\n"

    fromJson+="  );}"
    toJson+="  }"+(")" if doExtends else "")+";"
    const+="  });\n"
    out+=const+fromJson+"\n"
    out+=toJson
    out+="\n}\n"

    if len(checkFalsy) != 0 and b not in output:
        output=b+"\n"+output
    output+=out+"\n"
    return name

generate(d, name)
if not useStdin:
    cacheDir = os.path.dirname(cachePath)

    if not os.path.exists(cacheDir): 
        os.makedirs(cacheDir)
    import shutil
    shutil.copyfile(path,cachePath)

open(name+".dart","w",encoding="utf-8").write(purgeUnusedClasses(output))
