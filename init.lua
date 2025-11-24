if vim.g.vscode then
  require "user.vscode"
  require "user.fcitx5-switch"
  vim.cmd([[source $HOME/.config/nvim/lua/user/vscode/setting.vim]])
else
  require "user.options"
  require "user.lazy"
  require "user.keymaps"
  require "user.autocmds"
  require "user.fcitx5-switch"
  -- require "user.dap"
end
