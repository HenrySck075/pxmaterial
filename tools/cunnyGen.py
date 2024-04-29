import re, subprocess
severe = re.compile(r"  ([a-zA-Z@\[\]]*) ([a-zA-Z]*)( \[optional\])?;")
severeSkillIssue = re.compile("  ([a-zA-Z]*),")

contents = []
while True:
    try:
        line = input()
    except EOFError:
        break
    contents.append(line)

contentsStr = "\n".join(contents)

t = {
    "string": "str",
}
h = re.match(r"(?:(?:class)|(?:enum)) ([a-zA-Z@]*)(?: extends ([a-zA-Z@]*))?",contentsStr)
def ref(name):
    if name.startswith("@"): name = name[1:]+"Reference"
    return name
classname = ref(h.group(1)) # type: ignore
try: superclass = ref(h.group(2)) # type: ignore
except IndexError: superclass = "TypedDict"
except: superclass = ""

out = ""

if contentsStr.startswith("class"):
    requiredDict = ""
    optionalDict = ""
    for d in severe.findall(contentsStr):   
        typename = d[0]
        varname = d[1]
        optional = d[2]!=""
        typename = ref(t.get(typename, typename))
        typenameOrg = str(typename)
        typename = typename.replace("[]","")
        while typenameOrg.endswith("[]"): 
            typenameOrg = typenameOrg.removesuffix("[]")
            typename = "list["+typename+"]"

        s = f"    {varname}: {typename}"+"\n"
        if optional: optionalDict+=s
        else: requiredDict+=s 

    hasOptional = optionalDict!=''

    out+="class "
    if hasOptional:out+=f"_{classname}Required({superclass})"
    else: out+=f"{classname}({superclass})"
    out+=":\n" 
    if hasOptional: 
        out+= requiredDict
        out+=f"class {classname}(_{classname}Required,total=False):"+"\n"+optionalDict
    else: out+=requiredDict
elif contentsStr.startswith("enum"):
    enums = ""
    for i in severeSkillIssue.findall(contentsStr):
        enums+=f"    {i} = '{i}'"+"\n"
    out+=f"class {classname}(Enum):"+"\n"+enums

subprocess.run(["termux-clipboard-set"],input=out.encode())
