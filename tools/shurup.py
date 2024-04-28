from typing import Any, Callable, Literal, TypedDict, Union, overload
import websocket, json 

class StreamInfo(TypedDict):
    streamId: Union[ 
        Literal["VM"],
        Literal["Isolate"],
        Literal["Debug"],
        Literal["Profiler"],
        Literal["GC"],
        Literal["Extension"],
        Literal["Timeline"],
        Literal["Logging"],
        Literal["Service"],
        Literal["HeapSnapshot"],
        str
    ]

class StreamCpuSamplesWithUserTag(TypedDict):
    userTags: list[str] 

@overload 
def send(name: Literal["streamListen"], params: StreamInfo): ...
@overload 
def send(name: Literal["streamCancel"], params: StreamInfo): ...
@overload 
def send(name: Literal["streamCpuSamplesWithUserTag"], params: StreamCpuSamplesWithUserTag): ...


socker = websocket.WebSocket()

class Event:
    def __init__(self) -> None:
        self._listeners: dict[str, dict[str,list[Callable[[ dict],None]]]] = {}
        

    def register(self, name: str, listener:Callable[[dict],None]):
        streamId, eventName = name.split("/")
        if streamId not in self._listeners: 
            self._listeners[streamId] = {}
            send("streamListen", {"streamId": streamId})
        if eventName not in self._listeners[streamId]: self._listeners[streamId][eventName] = []
        self._listeners[streamId][eventName].append(listener)

    def unregister(self, listener): 
        streamId = ""
        eventName = ""
        for k,v in self._listeners.items():
            found = False
            for k2,v2 in v.items():
                try: v2.remove(listener)
                except ValueError: continue 
                else: 
                    streamId = k 
                    eventName = k2
                    found = True
                    break 
            if found: break 

        e = self._listeners[streamId]
        if len(e[eventName]) == 0: e.pop(eventName)
        if len(e) == 0:  
            self._listeners.pop(streamId)
            send("streamCancel",{"streamId":streamId})
            


def send(method: str, params: dict[str,Any]): # type: ignore
    socker.send(json.dumps({
        "jsonrpc": "2.0",
        "method": method,
        "params": params,
        "id": "0"
    }))

send("streamListen", {"streamId": "Debug"})


