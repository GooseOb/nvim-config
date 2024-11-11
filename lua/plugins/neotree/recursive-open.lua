local function open_dir(state, dir_node)
	local fs = require("neo-tree.sources.filesystem")
	fs.toggle_directory(state, dir_node, nil, true, false)
	vim.wait(50) -- required for correct operation (?)
end

return function(state, node, max_depth)
	local max_depth_reached = 1
	local stack = { node }
	while next(stack) ~= nil do
		node = table.remove(stack)
		if node.type == "directory" and not node:is_expanded() then
			open_dir(state, node)
		end

		local depth = node:get_depth()
		max_depth_reached = math.max(depth, max_depth_reached)

		if not max_depth or depth < max_depth - 1 then
			local children = state.tree:get_nodes(node:get_id())
			for _, v in ipairs(children) do
				table.insert(stack, v)
			end
		end
	end

	return max_depth_reached
end
