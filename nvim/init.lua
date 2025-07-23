require 'core.options'
require 'core.snippets'
require 'core.keymaps'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
vim.g.clipboard = {
  name = 'xclip',
  copy = { ['+'] = 'xclip -selection clipboard', ['*'] = 'xclip -selection clipboard' },
  paste = { ['+'] = 'xclip -selection clipboard -o', ['*'] = 'xclip -selection clipboard -o' },
}
if os.getenv 'WSL_DISTRO_NAME' then
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ['+'] = { 'win32yank.exe', '-i', '--crlf' },
      ['*'] = { 'win32yank.exe', '-i', '--crlf' },
    },
    paste = {
      ['+'] = { 'win32yank.exe', '-o', '--lf' },
      ['*'] = { 'win32yank.exe', '-o', '--lf' },
    },
    cache_enabled = false,
  }
else
  vim.opt.clipboard = 'unnamedplus'
end

require('lazy').setup {
  require 'plugins.colortheme',
  require 'plugins.neotree',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.none-ls',
  require 'plugins.gitsigns',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.comment',
}
