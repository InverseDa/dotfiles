local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use {'wbthomason/packer.nvim'}
    -- 你的插件列表...
    use {"folke/tokyonight.nvim"}
    use {"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}}
    use {"akinsho/bufferline.nvim", requires = {"nvim-tree/nvim-web-devicons", "moll/vim-bbye"}}
    use {"nvim-lualine/lualine.nvim", requires = {"nvim-tree/nvim-web-devicons"}}
    use {"arkav/lualine-lsp-progress"}
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}}
    use {"glepnir/dashboard-nvim"}
    use {"ahmedkhalf/project.nvim"}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    --------------------- LSP --------------------
    use {"williamboman/mason.nvim"}
    use {"williamboman/mason-lspconfig.nvim"}
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
  },
})
-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
