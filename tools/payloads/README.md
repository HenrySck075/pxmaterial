![Remember](https://github.com/HenrySck075/pxmaterial/blob/main/assets/remember.gif)

tl;dr:
```
`$name` (str): use this name instead of the key
`$type` (str): this object is this type 
`$schema` (str, path-like): ref the type of an external file
`$checkFalsy` (bool): list of objects that needs to check for falsy to nullfies it 
`$nullable` (list[str]): nullable 
`$typedef` (dict[str, str]): typedefing my beloved (it hasnt been used)
`$desc` (dict[str,str]): Map of item comments
`$this` (only in $desc as value): The object itself
`$useType` (str): unused, can be found in objects using TagTranslation
`$extends` (str, path-like): The object extends this object
`$copy` (str): The object copies the structure of this object. Default value is `$extends`
`$skip` (bool): Do not generate this file. This should be used on objects that being referenced by `$copy`
```
these are all block-scope codegen modifier banger use it


json my soul



i have severe naming issue
