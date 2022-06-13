local Llama = require(script.Parent.Parent.Llama)

return function()
	local Class = require(script.Parent.Class)

	local INSTANCE = {
		Members = {
			{
				Category = "Data";
				MemberType = "Property";
				Name = "Name";
				Security = {
					Read = "None";
					Write = "None";
				};
				Serialization = {
					CanLoad = true;
					CanSave = true;
				};
				ThreadSafety = "ReadSafe";
				ValueType = {
					Category = "Primitive";
					Name = "string";
				};
				Tags = {
					"Yeehaw";
				};
			}
		};
		MemoryCategory = "Instances";
		Name = "Instance";
		Superclass = "<<<ROOT>>>";
		Tags = {
			"NotCreatable";
			"NotBrowsable";
		};
	}

	local STATS_ITEM = {
		Members = {
			{
				Category = "Data";
				MemberType = "Property";
				Name = "DisplayName";
				Security = {
					Read = "PluginSecurity";
					Write = "PluginSecurity";
				};
				Serialization = {
					CanLoad = false;
					CanSave = false;
				};
				Tags = {
					"Hidden";
					"ReadOnly";
					"NotReplicated";
				};
				ThreadSafety = "ReadSafe";
				ValueType = {
					Category = "Primitive";
					Name = "string";
				}
			};
			{
				MemberType = "Function";
				Name = "GetValue";
				Parameters = {};
				ReturnType = {
					Category = "Primitive";
					Name = "double";
				};
				Security = "PluginSecurity";
				ThreadSafety = "Unsafe";
			}
		};
		MemoryCategory = "Instances";
		Name = "StatsItem";
		Superclass = "Instance";
		Tags = {
			"NotCreatable"
		};
	}

	describe("Class", function()
		local superclass = Class.new(INSTANCE)
		local class = Class.new(STATS_ITEM)
		class.superclass = superclass

		describe("getAllMembers", function()
			it("should get recursively", function()
				expect(
					Llama.Dictionary.count(
						class:getAllMembers(true)
					)
				).to.equal(3)
			end)
			it("should not get recursively", function()
				expect(
					Llama.Dictionary.count(
						class:getAllMembers()
					)
				).to.equal(2)
			end)
		end)

		describe("getAllMembersOfType", function()
			it("should get recursively", function()
				expect(
					Llama.Dictionary.count(
						class:getAllMembersOfType(
							"Property",
							true
						)
					)
				).to.equal(2)
			end)
			it("should not get recursively", function()
				expect(
					Llama.Dictionary.count(
						class:getAllMembersOfType("Property")
					)
				).to.equal(1)
			end)
		end)

		describe("getAllMembersByTag", function()
			it("should get recursively", function()
				expect(
					Llama.Dictionary.count(
						class:getAllMembersByTag(
							"Yeehaw",
							true
						)
					)
				).to.equal(1)
			end)
			it("should not get recursively", function()
				expect(
					Llama.Dictionary.count(
						class:getAllMembersByTag("Yeehaw")
					)
				).to.equal(0)
			end)
		end)
	end)
end