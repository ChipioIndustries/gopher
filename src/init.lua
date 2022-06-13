local HttpService = game:GetService("HttpService")

local Constants = require(script.Constants)
local Class = require(script.Class)
local MemberType = require(script.MemberType)
local retry = require(script.retry)

local Gopher = {}
Gopher.__index = Gopher

local versionId = retry(
	Constants.RETRY_DELAY,
	Constants.MAX_RETRIES,
	HttpService.GetAsync,
	HttpService,
	Constants.VERSION_ENDPOINT
)

Gopher._dump = HttpService:JSONDecode(
	retry(
		Constants.RETRY_DELAY,
		Constants.MAX_RETRIES,
		HttpService.GetAsync,
		HttpService,
		Constants.DUMP_ENDPOINT:format(versionId)
	)
)

function Gopher.new()
	local self = setmetatable({
		_classes = {};
	}, Gopher)

	for _index, class in ipairs(self._dump.Classes) do
		self._classes[class.Name] = Class.new(class)
	end

	for _className, class in pairs(self._classes) do
		class.superclass = self._classes[class._class.Superclass]
	end

	return self
end

function Gopher:getRawDump()
	return self._dump
end

function Gopher:getAllClasses()
	return self._classes
end

function Gopher:getClass(className)
	return self._classes[className]
end

Gopher.MemberType = MemberType

return Gopher.new()