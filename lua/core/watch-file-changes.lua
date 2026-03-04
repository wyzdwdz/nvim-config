local watchers = {}

local function watch_file_changes()
	vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
		group = vim.api.nvim_create_augroup("AutoWatchFiles", { clear = true }),
		callback = function(args)
			local file = args.file
			if file == "" or not vim.uv.fs_stat(file) then
				return
			end

			if watchers[args.buf] then
				return
			end

			local watcher = vim.uv.new_fs_event()
			watchers[args.buf] = watcher

			watcher:start(
				file,
				{},
				vim.schedule_wrap(function(err, _, events)
					if err then
						return
					end
					if events.change or events.rename then
						if vim.api.nvim_buf_is_valid(args.buf) then
							vim.api.nvim_command("checktime " .. args.buf)
						end
					end
				end)
			)

			vim.api.nvim_create_autocmd("BufWipeout", {
				buffer = args.buf,
				callback = function()
					if watchers[args.buf] then
						watchers[args.buf]:stop()
						watchers[args.buf]:close()
						watchers[args.buf] = nil
					end
				end,
			})
		end,
	})
end

watch_file_changes()
