return function(tbl, func)
	for i, v in ipairs(tbl) do
		tbl[i] = func(v)
	end
	return tbl
end
