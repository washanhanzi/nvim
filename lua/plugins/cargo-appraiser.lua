return {
  dir="~/Github/cargo-appraiser.nvim/",
  -- 'washanhanzi/cargo-appraiser.nvim',
  dependencies = {
     'neovim/nvim-lspconfig',
  },
  -- cond = function()
  --   return vim.fn.expand('%:t') == 'Cargo.toml' 
  -- end,
  config = function()
    require('cargo-appraiser').setup()
  end
}
