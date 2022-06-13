local function retry(retryDelay, maxRetries, callback, ...)
	local success, result
	local retries = 0

	repeat
		success, result = pcall(callback, ...)
		retries += 1
		if not success and retryDelay then
			task.wait(retryDelay)
		end
	until success or maxRetries >= retries

	if not success then
		error(result)
	end

	return result
end

return retry