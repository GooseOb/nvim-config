return function(tbl, start, finish)
	local sliced_table = {}
	start = start or 1
	finish = finish or #tbl

	for i = start, finish do
		if tbl[i] ~= nil then
			table.insert(sliced_table, tbl[i])
		end
	end

	return sliced_table
end
