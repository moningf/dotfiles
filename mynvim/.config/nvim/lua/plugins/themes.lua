return {
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000 ,
    opts = {
      auto_integrations = true,
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      -- flavour = "latte", -- latte, frappe, macchiato, mocha
    },
    config = function(_,opts)
      -- print(vim.inspect(_))
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin-nvim"
    end
  },
  {

  }
}
