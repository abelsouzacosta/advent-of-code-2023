local function openfile(filename, mode)
	local file, error = io.open(filename, mode)
	if error then
		print("There was an error trying to open the file")
	end

	return file
end

-- check if it is a number
local function isNumber(input)
	return input:match("%d") ~= nil
end

-- reverse the line
local function reverse(string)
	local reversed = ""
	for i = #string, 1, -1 do
		reversed = reversed .. string:sub(i, i)
	end

	return reversed
end

-- loop through the line until find the first number
local function getFirstNumber(string)
	for i = 1, #string do
		local char = string:sub(i, i)
		if isNumber(char) then
			return char
		end
	end
end

-- reverses the line given and returns the first number found
local function getLastNumber(string)
	local reversedString = reverse(string)
	for i = 1, #reversedString do
		local char = reversedString:sub(i, i)
		if isNumber(char) then
			return char
		end
	end
end


-- will return the number in the line
-- the number is formed by the first and the last number found in the line
local function getLineNumber(line)
	local first = getFirstNumber(line)
	local last = getLastNumber(line)
	local number = first .. last

	return tonumber(number)
end

local function readfile()
	-- open the file
	local input = openfile("/home/junior/www/advent-of-code-2023/data/input.txt", "r")

	for line in input:lines() do
		local number = getLineNumber(line)
		print(number)
	end

	-- manually closes the file
	input:close()
end

readfile()
