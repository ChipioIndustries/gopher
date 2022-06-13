return function()
	local retry = require(script.Parent.retry)

	local function makeErrorFunction(count)
		local attempts = 0
		local function errorTill()
			attempts += 1
			assert(attempts == count, "Intentional error")
		end
		return errorTill
	end

	describe("retry", function()
		it("should retry many times", function()
			expect(function()
				retry(nil, 3, makeErrorFunction(3))
			end).never.to.throw()
		end)

		it("should not retry forever", function()
			expect(function()
				retry(nil, 3, error)
			end).to.throw()
		end)

		it("shouldn't delay with no retryDelay", function()
			local result
			task.spawn(function()
				retry(nil, 3, makeErrorFunction(3))
				result = true
			end)
			expect(result).to.equal(true)
		end)

		it("should delay with retryDelay", function()
			local start = tick()
			retry(0.21, 3, makeErrorFunction(3))
			expect((tick() - start) > 0.4).to.equal(true)
		end)
	end)
end