local Llama = require(script.Parent.Parent.Llama)

local Class = {}
Class.__index = Class

function Class.new(class)
	local self = setmetatable({
		_class = class;
		_members = {};
	}, Class)

	for _index, member in ipairs(class.Members) do
		self._members[member.Name] = member
	end

	return self
end

function Class:getAllMembers(recursive)
	local members = {}

	for memberName, member in pairs(self._members) do
		members[memberName] = member
	end

	if recursive and self.superclass then
		members = Llama.Dictionary.join(members, self.superclass:getAllMembers(true))
	end

	return members
end

function Class:getAllMembersOfType(memberType, recursive)
	local allMembers = self:getAllMembers(recursive)
	local members = {}

	for memberName, member in pairs(allMembers) do
		if member.MemberType == memberType then
			members[memberName] = member
		end
	end

	return members
end

function Class:getAllMembersByTag(tag, recursive)
	local allMembers = self:getAllMembers(recursive)
	local members = {}

	for memberName, member in pairs(allMembers) do
		if member.Tags and table.find(member.Tags, tag) then
			members[memberName] = member
		end
	end

	return members
end

function Class:getMember(name, recursive)
	if not self._members[name] and recursive and self.superclass then
		return self.superclass:getMember(name, true)
	end
	return self._members[name]
end

return Class