function openfile(filename, mode)
	local file, error = io.open(filename, mode)
	if error then
		print("There was an error trying to open the file")
	end

	return file
end

function readfile()
	-- open the file
	local input = openfile("/home/junior/www/advent-of-code-2023/data/input.txt", "r")

	for line in input:lines() do
		print(line)
	end

	-- manually closes the file
	input:close()
end

readfile()
