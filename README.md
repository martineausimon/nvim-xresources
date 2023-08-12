# nvim-xresources

**nvim-xresources** is a colorscheme for ([Neovim](https://github.com/neovim/neovim) that uses your Xresources colors.

## WHY ?

I've never really enjoyed using a colorscheme: for me, the ideal setup is the nvim default with my colors defined in Xresources. However many plugins require the use of true colors with `set termguicolors`. The concept of this plugin is to stay faithful to the colors defined in Xresources, but in true colors.

## FEATURES

This plugin aims for simplicity, though I have incorporated a few extra choices:

* **auto_light** feature: useful when Xresources only contains 8 colors
* **palette_overrides**: change palette colors
* **custom_highlight_groups**: override or add groups
* **treesitter support**

<p align="center">
<img src="https://user-images.githubusercontent.com/89019438/260174496-d7fc80a6-5b77-45ae-aece-3b2d3193e246.png">
</p>

## CONTRIBUTING

This plugin is a work in progress, and there are many things missing! I am more than willing to accept pull requests to help improve it.

## INSTALL

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'martineausimon/nvim-xresources/',
  priority = 1000,
  config = function()
    require('nvim-xresources').setup({
      xresources_path = os.getenv("HOME") .. '/.Xresources',
      auto_light = {
        enable = true,
        value = 0.5,
        exclude = {},
      },
      palette_overrides = {},
      custom_highlight_groups = {},
    })
  end
}
```

add this line in your `init.lua` :

```lua
vim.cmd('colorscheme xresources')
```

## CONFIG

an example setup :

```lua
{
  'martineausimon/nvim-xresources/',
  priority = 1000,
  config = function()
    local C = require('nvim-xresources.colors')
    require('nvim-xresources').setup({
      xresources_path = os.getenv("HOME") .. '/.Xresources',
      auto_light = {
        enable = true,
        value = 0.5,
        exclude = {
          light_green,
          light_blue,
        }
      },
      palette_overrides = {
        green = "#3CB371",
      },
      custom_highlight_groups = {
        -- link to a existing group :
        pythonBuiltin = "PreProc",
        -- or define highlights :
        pythonFunction = { guifg = C.cyan, guibg = nil, gui = "bold", guisp = nil },
      },
    })
  end
}
```

## CREDITS, INSPIRATION

[gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)
[nord.nvim](https://github.com/shaunsingh/nord.nvim)
[xresources-nvim](https://github.com/nekonako/xresources-nvim)
[nvim-base16](https://github.com/RRethy/nvim-base16)
