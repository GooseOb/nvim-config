local function search_buf()
	require("telescope.builtin").buffers({
		sort_mru = true,
		ignore_current_buffer = true,
		show_all_buffers = false,
		attach_mappings = function(prompt_bufnr, map)
			local refresh_buffer_searcher = function()
				require("telescope.actions").close(prompt_bufnr)
				vim.schedule(search_buf)
			end

			local delete_multiple_buf = function()
				local action_state = require("telescope.actions.state")
				local picker = action_state.get_current_picker(prompt_bufnr)
				local selection = picker:get_multi_selection()
				if next(selection) == nil then
					selection = action_state.get_selected_entry()
					vim.api.nvim_buf_delete(selection.bufnr, { force = true })
				else
					for _, entry in ipairs(selection) do
						vim.api.nvim_buf_delete(entry.bufnr, { force = true })
					end
				end
				refresh_buffer_searcher()
			end

			map("n", "<C-d>", delete_multiple_buf)
			map("i", "<C-d>", delete_multiple_buf)

			return true
		end,
	})
end

return search_buf
