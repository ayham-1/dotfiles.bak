require("altffour.telescope")
require("altffour.lsp")
require("altffour.autocompletion")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

require('neoscroll').setup({
	use_local_scrolloff = false,
	espect_scrolloff = false,
})

require('twilight').setup()
require('zen-mode').setup()
require('lualine').setup({
	options = {
		theme = '16color'
	}
})
require('diffview').setup()
--"vim.opt.termguicolors = true
require('bufferline').setup()
require('luasnip/loaders/from_vscode').load()
require('gitsigns').setup({
	current_line_blame = true,
})
