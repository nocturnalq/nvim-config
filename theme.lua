require('kanagawa').setup({
  compile = false,
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,
  dimInactive = false,
  terminalColors = true,
  theme = "dragon",
  background = {
    dark = "dragon",
    light = "lotus",
  },
  colors = {
    palette = {
      -- Lift the main background one step (dragonBlack3 -> dragonBlack2 equivalent)
      -- Dragon blacks: 0=#0d0c0c 1=#12120f 2=#1D1C19 3=#181616 4=#282727 5=#393836 6=#625e5a
      dragonBlack3 = "#1e1e1a",  -- slightly lighter than default #181616
    },
    theme = {
      dragon = {
        ui = {
          -- Use the brighter fujiWhite (#DCD7BA) instead of dragonWhite (#c5c9c5)
          fg = "#DCD7BA",
        },
        syn = {
          -- Brighter comment color (fujiGray #727169 instead of dragonAsh #737c73)
          comment = "#8a8980",
          -- Use wave-equivalent brighter greens/yellows for syntax
          string   = "#98BB6C",  -- springGreen (wave) instead of dragonGreen2 #87a987
          constant = "#FFA066",  -- surimiOrange instead of dragonOrange #c4966a
          identifier = "#E6C384", -- carpYellow instead of dragonYellow #c4b28a
          fun      = "#7E9CD8",  -- crystalBlue instead of dragonBlue2 #6693bf
          type     = "#7AA89F",  -- waveAqua2 instead of dragonAqua #7fb4ca (close but brighter)
          keyword  = "#957FB8",  -- oniViolet instead of dragonViolet #8992a7
          statement = "#957FB8",
          number   = "#D27E99",  -- sakuraPink instead of dragonPink #a292a3
          operator = "#C0A36E",  -- boatYellow2 instead of dragonRed #c4746e
        },
      },
    },
  },
  overrides = function(colors)
    local p = colors.palette
    return {
      -- Brighter normal text
      Normal    = { fg = "#DCD7BA" },
      NormalNC  = { fg = "#C8C093" },
      -- Brighter popup/completion menu
      Pmenu     = { fg = "#DCD7BA", bg = p.waveBlue1 },
      PmenuSel  = { fg = "NONE",    bg = p.waveBlue2 },
    }
  end,
})

vim.cmd.colorscheme("kanagawa-dragon")
