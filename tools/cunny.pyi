"DDS Object Types"
"actually no please dont use this"
from typing import TypedDict 
from enum import Enum

class _BreakpointRequired(TypedDict):
    location: SourceLocation
    breakpointNumber: int 
    enabled: bool 
    resolved: bool 
class Breakpoint(_BreakpointRequired,total=False):
    isSyntheticAsyncContinuation: bool

class _ClassReferenceRequired(ObjectReference):
    name: str 
    library: str
class ClassReference(_ClassReferenceRequired,total=False):
    location: str
    typeParameters: list[str]
class Class(ClassReference):...

class ContextReference(ObjectReference):
    length: int

class _FunctionReferenceRequired(ObjectReference):
    name: str
    static: bool
    const: bool
    implicit: bool
    abstract: bool
    isGetter: bool
    isSetter: bool
class FunctionReference(_FunctionReferenceRequired,total=False):
    location: SourceLocation

class _InstanceReferenceRequired(ObjectReference):
    kind: InstanceKind
    identityHashCode: int
    _class: ClassReference
class InstanceReference(_InstanceReferenceRequired,total=False):
    valueAsString: str
    valueAsStringIsTruncated: bool
    length: int
    name: str
    typeClass: ClassReference
    parameterizedClass: ClassReference
    returnType: InstanceReference
    parameters: list[Parameter]
    typeParameters: InstanceReference
    pattern: InstanceReference
    closureFunction: FunctionReference
    closureContext: ContextReference
    closureReceiver: InstanceReference
    portId: int
    allocationLocation: InstanceReference
    debugName: str
    label: str

class InstanceKind(Enum):
    PlainInstance = 'PlainInstance'
    Null = 'Null'
    Bool = 'Bool'
    Double = 'Double'
    Int = 'Int'
    String = 'String'
    List = 'List'
    Map = 'Map'
    Set = 'Set'
    Record = 'Record'
    StackTrace = 'StackTrace'
    Closure = 'Closure'
    MirrorReference = 'MirrorReference'
    RegExp = 'RegExp'
    WeakProperty = 'WeakProperty'
    WeakReference = 'WeakReference'
    Type = 'Type'
    TypeParameter = 'TypeParameter'
    TypeRef = 'TypeRef'
    FunctionType = 'FunctionType'
    RecordType = 'RecordType'
    BoundedType = 'BoundedType'
    ReceivePort = 'ReceivePort'
    UserTag = 'UserTag'
    Finalizer = 'Finalizer'
    NativeFinalizer = 'NativeFinalizer'
    FinalizerEntry = 'FinalizerEntry'

class IsolateReference(Response):
    id: str 
    number: str 
    name: str 
    isSystemIsolate: bool 
    isolateGroupId: str 

class IsolateGroupReference(Response):
    id: str
    number: str
    name: str
    isSystemIsolateGroup: bool
class IsolateGroup(IsolateGroupReference):
    isolates: list[IsolateReference]

class LibraryReference(ObjectReference):
    name: str
    uri: str

class LogRecord(Response):
    message: InstanceReference
    time: int
    level: int
    sequenceNumber: int
    loggerName: InstanceReference
    zone: InstanceReference
    error: InstanceReference
    stackTrace: InstanceReference

class _ObjectReferenceRequired(Response):
    id: str 
class ObjectReference(_ObjectReferenceRequired,total=False):
    fixedId: str
class Object(ObjectReference,total=False):
    size:int 
#class Object(TypedDict("invalid",{"class": int}),_Object): pass

class _ParameterRequired(TypedDict):
    parameterType: InstanceReference
    fixed: bool
class Parameter(_ParameterRequired,total=False):
    name: str
    required: bool

class Response(TypedDict):
    type: str

class ScriptReference(ObjectReference):
    uri: str
class _ScriptRequired(Object):
    uri: str
    library: LibraryReference
class Script(_ScriptRequired,total=False):
    lineOffset: int
    columnOffset: int
    source: str
    tokenPosTable: list[list[int]]

class Sentinel(Response):
    kind: SentinelKind
    valueAsString: str
class SentinelKind(Enum):
    Collected = 'Collected'
    Expired = 'Expired'    
    NotInitialized = 'NotInitialized'    
    BeingInitialized = 'BeingInitialized'    
    OptimizedOut = 'OptimizedOut'    
    Free = 'Free'

class _SourceLocationRequired(TypedDict):
    tokenPos: int 
    script: ScriptReference
class SourceLocation(_SourceLocationRequired, total=False):
    line: int 
    column: int 
    endTokenPos: int

class VMReference(Response):
    name: str
class VM(VMReference):
    architectureBits: int
    hostCPU: str
    operatingSystem: str
    targetCPU: str
    version: str
    pid: int
    startTime: int
    isolates: list[IsolateReference]
    isolateGroups: list[IsolateGroupReference]
    systemIsolates: list[IsolateReference]
    systemIsolateGroups: list[IsolateGroupReference]

