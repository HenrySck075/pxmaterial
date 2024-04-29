"CLI-based Dart Debugger"

from enum import Enum
import sys
from typing import Any, TYPE_CHECKING, Literal, overload
import websocket, json 

class LogLevel(Enum):
    All = 0
    Config = 700
    Fine = 500
    Finer = 400
    Finest = 300
    Info = 800
    Off = 2000
    Severe = 1000
    Shout = 1200
    Warning = 900

if TYPE_CHECKING:
    from hamood import *
    import cunny as DDSTypes
    @overload 
    def send(name: Literal["getObject"], params: GetObject) -> DDSTypes.Object|DDSTypes.Sentinel: ...
    @overload 
    def send(name: Literal["evaluateInFrame"], params: EvaluateInFrame): ...
    @overload 
    def send(name: Literal["getVM"]) -> DDSTypes.VM: ...
    @overload 
    def send(name: Literal["streamCancel"], params: StreamInfo): ...
    @overload 
    def send(name: Literal["streamCpuSamplesWithUserTag"], params: StreamCpuSamplesWithUserTag): ...
    @overload 
    def send(name: Literal["streamListen"], params: StreamInfo): ...

reserved = ["class"]
"Reserved keywords that is used by DDS"

socker = websocket.WebSocket(enable_multithread=True)
id = 0
def reservedReplace(h: dict[str,Any]):
    o = {}
    for k,v in h.items():
        if k in reserved: k = "_"+k 
        o[k] = v
    return o
def send(method: str, params: dict[str,Any] = {}) -> dict[str,Any]: # type: ignore
    global id
    socker.send(json.dumps({
        "jsonrpc": "2.0",
        "method": method,
        "params": params,
        "id": str(id)
    }))
    d: dict = {}
    while True:  
        d = json.loads(socker.recv(),object_hook=reservedReplace)
        if d.get("method","") == "streamNotify" and d["params"]["streamId"] == "Logging": log(d)
        if d.get("id","-1") == str(id): break
    id+=1
    return d

isolateId = send('getVM')["isolates"][0]["id"]
send("streamListen",{"streamId":"Debug"})
def getSourceAroundLine(source:list[str],line:int,column:int=-1):
    out=""
    l = len(str(line+3))
    for i in range(max(0,line-3),min(len(source)-1,line+3)):
        out+=str(i).ljust(l)+source[i]+"\n"
        if column!=-1: out+=" "*l+" "*(column-1)+"^\n"
    return out
paused = False
evalMode = False
def log(h):
    record: DDSTypes.LogRecord = h["params"]["event"]["logRecord"]
    content = record["message"]
    level = LogLevel(record["level"])
    out=content.get("valueAsString","") 
    if level == LogLevel.Severe:
        out="=======Unhandled Exception=======\n"+out+"\nThe stack trace when the error is thrown is:\n"+record["error"].get("valueAsString","")+"\n================================="
    else:
        out = level.name+": "+out
    print(out)
socker.connect(sys.argv[1])
while True:
    if paused:
        cmd = input(">"*(1 if evalMode else 3)+" ")
        if evalMode:
            send("evaluateInFrame",{"frameIndex":0,"isolateId":isolateId,"expression":cmd})
        else:
            scmd = cmd.split()
            match scmd[0]:
                case "exit": exit()
                case "continue": 
                    paused = False 
                    continue

    else:
        h = json.loads(socker.recv(),object_hook=reservedReplace)
        if h.get("method","") == "streamNotify":
            if (
                h["params"]["streamId"] == "Debug"
                and h["params"]["event"]["kind"] == "PauseBreakpoint"
            ):
                bp: DDSTypes.Breakpoint = h["params"]["event"]["breakpoint"]
                bpNum = bp["breakpointNumber"]
                bpLoc = bp["location"]
                line: int = bpLoc.get("line",0)
                col: int = bpLoc.get("column",-1)
                scriptObject: DDSTypes.Script = send( # type: ignore # why dont it work
                    "getObject",
                    {
                        "objectId":bpLoc["script"]["id"],
                        "isolateId":isolateId
                    }
                )
                scriptSourceAroundLine = getSourceAroundLine(scriptObject.get("source","").splitlines(),line,col)
                print(f"""Breakpoint {bpNum} hit at line {line}, column {col}:
    {scriptSourceAroundLine}""")
                paused = True
            elif h["params"]["streamId"] == "Logging":
                log(h)
        else: continue

