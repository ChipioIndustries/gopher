local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TestEZ = require(ReplicatedStorage.DevPackages.TestEZ)

TestEZ.TestBootstrap:run(
	{
		ReplicatedStorage.Packages.Gopher
	},
	TestEZ.Reporters.TextReporter
)