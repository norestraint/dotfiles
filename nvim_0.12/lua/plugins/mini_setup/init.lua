vim.pack.add({
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.files",
	"https://github.com/nvim-mini/mini.operators",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.clue",
	"https://github.com/nvim-mini/mini.notify",
	"https://github.com/nvim-mini/mini.hipatterns",
})

local function packadd(plugin)
	vim.cmd("packadd " .. plugin)
end

packadd("mini.icons")
packadd("mini.files")
packadd("mini.operators")
packadd("mini.pairs")
packadd("mini.clue")
packadd("mini.notify")

require("plugins.mini_setup.mini-icons-config")
require("plugins.mini_setup.mini-files-config")
require("plugins.mini_setup.mini-operators-config")
require("plugins.mini_setup.mini-pairs-config")
require("plugins.mini_setup.mini-clue-config")
require("plugins.mini_setup.mini-notify-config")
