---
sidebar_position: 2
---

# Usage

Begin by requiring the module.

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Gopher = require(ReplicatedStorage.Packages.Gopher)
```

## Getting the Dump

To get the raw API dump including classes and enums, call `getRawDump`:

```lua
local dump = Gopher:getRawDump()

print(#dump.Classes) -- print number of classes
```

## Getting Classes

To get a particular class, call `getClass` and provide the class name:

```lua
local instanceClass = Gopher:getClass("Instance")
```

To get all classes in the form of a dictionary, use `getAllClasses`:

```lua
local classes = Gopher:getAllClasses()

print(classes.Instance)
```

## Using Classes

Classes are objects with functions that can be used to get a class's corresponding members. These functions support **recursion**, which makes it easy get get inherited class members with the same function call.

```lua
local partClass = Gopher:getClass("BasePart")

partClass:getAllMembers(true)

-- prints info of the Name property, which is under Instance
print(partClass.Name)
```
