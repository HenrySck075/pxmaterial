from enum import Enum
from typing import Literal, TypedDict, Union


class GetObject(TypedDict):
    isolateId: str 
    objectId: str

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

class _EvaluateInFrame(TypedDict):
    frameIndex: int 
    isolateId: str 
    expression: str 
class EvaluateInFrame(_EvaluateInFrame,total=False):
    disableBreakpoints: bool
