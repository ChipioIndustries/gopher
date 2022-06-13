---
sidebar_position: 3
---
# MemberType

MemberType is an enum for the different class member types. This is meant to be passed to `Class:getAllMembersOfType`. A string with the enum name can also be used.

## Enum Items

* Callback
* Event
* Function
* Property

## Usage

```lua
class:getAllMembersOfType(Gopher.MemberType.Property)
```
