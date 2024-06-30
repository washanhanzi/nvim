if vim.g.vscode then
  require "user.vscode"
  vim.cmd([[source $HOME/.config/nvim/lua/user/vscode/setting.vim]])
else
  require "user.options"
  require "user.lazy"
  require "user.keymaps"
  require "user.autocmds"
  -- require "user.dap"
end
