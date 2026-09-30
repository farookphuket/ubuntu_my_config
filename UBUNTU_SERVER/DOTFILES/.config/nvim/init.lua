require("config.lazy")
require("config.options")
require("config.keymaps")

-- ดักจับ error ทั้งหมดแล้วบันทึกลงไฟล์
vim.schedule(function()
	vim.api.nvim_create_autocmd("BufReadPost", {
		callback = function()
			local ok, err = pcall(function()
				-- โค้ดที่อาจ error
			end)
			if not ok then
				vim.fn.writefile({ tostring(err) }, "/tmp/nvim_runtime_error.log", "a")
			end
		end,
	})
end)
