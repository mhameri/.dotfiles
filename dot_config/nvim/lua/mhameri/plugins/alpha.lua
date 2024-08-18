-- https://github.com/goolord/alpha-nvim
return {
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    },
    config = function()
    --   require('alpha').setup(require('alpha.themes.theta').section.terminal.command = vim.fn.stdpath("config") .. "/nvim-logo -t".config)
      local theta = require("alpha.themes.theta")
      local dashboard = require("alpha.themes.dashboard")
      theta.header.val={
        '          ',
        '        ███████████           █████      ██',
        '       ███████████             █████ ',
        '       ████████████████ ███████████ ███   ███████',
        '      ████████████████ ████████████ █████ ██████████████',
        '     ██████████████    █████████████ █████ █████ ████ █████',
        '   ██████████████████████████████████ █████ █████ ████ █████',
        '  ██████  ███ █████████████████ ████ █████ █████ ████ ██████',
      }
      -- available: devicons, mini, default is mini
      theta.buttons.val = {
        { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("e", "  New file", "<cmd>ene<CR>"),
        dashboard.button("SPC f f", "󰈞  Find file"),
        dashboard.button("SPC f g", "󰊄  Live grep"),
        dashboard.button("c", "  Configuration", "<cmd>cd '~/.config/nvim'<CR>"),
        -- dashboard.button("c", "  Configuration", "<cmd>cd stdpath('config')<CR>"),
        dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
        dashboard.button("m", "  Mason", "<cmd>Mason<CR>"),
        dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
       }
      -- if provider not loaded and enabled is true, it will try to use another provider
      theta.file_icons.provider = "devicons"
      require("alpha").setup(
        theta.config
      )
	end,
  },
}
