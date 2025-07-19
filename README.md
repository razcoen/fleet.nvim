Dark Neovim theme with a minimal color palette inspired by JetBrains Fleet.

## Screenshots
<img width="2055" height="1289" alt="image" src="https://github.com/user-attachments/assets/fccbfa9c-875b-4628-9975-0ec464c7adeb" />

## Installation
### lazy.nvim
```lua
{
  "razcoen/fleet.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("fleet").setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = true,
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,   -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    })
    vim.cmd([[ colorscheme fleet ]])
  end,
}

```
