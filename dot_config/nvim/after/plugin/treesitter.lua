require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "python", "terraform" },
    sync_install = true,
    auto_install = true,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
}
-- vim.opt.runtimepath:append("/some/path/to/store/parsers")
