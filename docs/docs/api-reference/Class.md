---
sidebar_position: 2
---

# Class

A library for getting and parsing the Roblox API dump.

## Constructor

Get a class through the Gopher library:

```lua
local class = Gopher:getClass("Instance")
```

## Functions

|Return Type|Signature|Description|
|-|-|-|
|Dictionary|[`getAllMembers(bool recursive)`](#getAllMembers)|Get a dictionary of all members of the class.|
|Dictionary|[`getAllMembersOfType(MemberType memberType, bool recursive)`](#getAllMembersOfType)|Get a dictionary of all the class's members of a particular member type.|
|Dictionary|[`getAllMembersByTag(string tag, bool recursive)`](#getAllMembersByTag)|Get a dictionary of all the class's members that have a particular tag.|
|Dictionary|[`getMember(string memberName)`](#getMember)|Get the info of the provided member.|

## getAllMembers

Get a dictionary of all members of the class. If `recursive` is true, this list will include inherited members.

```lua
local class = Gopher:getClass("BasePart")

local members = class:getAllMembers()
local allMembers = class:getAllMembers(true)

print(members.Name) -- nil
print(allMembers.Name) -- dictionary
```

### Parameters

|Type|Name|Default|Description|
|-|-|-|-|
|bool|recursive|false|If true, the provided dictionary will include inherited members.|

## getAllMembersOfType

Get a dictionary of all the class's members of a particular member type. If `recursive` is true, this list will include inherited members.

```lua
local class = Gopher:getClass("BasePart")

local members = class:getAllMembersOfType(Gopher.MemberType.Property, true)

print(members.Name) -- dictionary
print(members.Touched) -- nil because Touched is not a property
```

### Parameters

|Type|Name|Default|Description|
|-|-|-|-|
|MemberType|memberType||The type of members to return.|
|bool|recursive|false|If true, the provided dictionary will include inherited members.|

## getAllMembersByTag

Get a dictionary of all the class's members that have a particular tag. If `recursive` is true, this list will include inherited members.

```lua
local class = Gopher:getClass("BasePart")

local members = class:getAllMembersByTag("Deprecated", true)

print(members.Name) -- nil because Name is not deprecated
print(members.name) -- dictionary
```

### Parameters

|Type|Name|Default|Description|
|-|-|-|-|
|string|tag||The tag to search members for.|
|bool|recursive|false|If true, the provided dictionary will include inherited members.|

## getMember

Get the info of the provided member. If `recursive` is true, this function will work for inherited members.

```lua
local class = Gopher:getClass("BasePart")

print(class:getMember("Name", true)) -- dictionary
print(class:getMember("Name")) -- nil because Name is inherited
```

### Parameters

|Type|Name|Default|Description|
|-|-|-|-|
|string|name||The name of the member to return.|
|bool|recursive|false|If true, this function will work for inherited members.|
