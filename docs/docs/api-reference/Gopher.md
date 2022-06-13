---
sidebar_position: 1
---

# Gopher

A library for getting and parsing the Roblox API dump.

## Functions

|Return Type|Signature|Description|
|-|-|-|
|Dictionary|[`getRawDump()`](#getRawDump)|Returns the JSON decoded raw API dump.|
|Dictionary\<Class\>|[`getAllClasses()`](#getAllClasses)|Returns a dictionary of all Class objects.|
|Class|[`getClass(string className)`](#getClass)|Returns a Class object with the provided name.|

## getRawDump

Returns the JSON decoded raw API dump.

```lua
local dump = Gopher:getRawDump()

print(#dump.Classes) -- print number of classes
```

## getAllClasses

Returns a dictionary of all Class objects.

```lua
local classes = Gopher:getAllClasses()

print(classes.Instance)
```

## getClass

Returns the JSON decoded raw API dump.

```lua
local instanceClass = Gopher:getClass("Instance")

print(instanceClass:getMember("Name")) -- dictionary
```

### Parameters

|Type|Name|Default|Description|
|-|-|-|-|
|string|className||The name of the class to return.|
