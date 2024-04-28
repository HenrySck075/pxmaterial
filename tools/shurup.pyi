from typing import Any, Literal, TypedDict, overload

class StreamInfo(TypedDict):
    streamId: str

class StreamCpuSamplesWithUserTag(TypedDict):
    userTags: list[str] 

@overload 
def send(name: Literal["streamListen"], params: StreamInfo): ...
@overload 
def send(name: Literal["streamCancel"], params: StreamInfo): ...
@overload 
def send(name: Literal["streamCpuSamplesWithUserTag"], params: StreamCpuSamplesWithUserTag): ...

def send(name: str, params: dict[str,Any]): ...
