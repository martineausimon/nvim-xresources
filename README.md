# nvim-xresources

**nvim-xresources** is a colorscheme for [Neovim](https://github.com/neovim/neovim) that uses your Xresources colors.

<details>
<summary>Screenshots</summary>

* with Nord Xresources:

<p align="center">
<img src="https://user-images.githubusercontent.com/89019438/260228482-b3813460-0361-4484-a7cd-9c06df0e3dfd.png" style="max-width: 70%;">
</p>

* with a kind of Gruvbox Xresources:

<p align="center">
<img src="https://user-images.githubusercontent.com/89019438/260228595-bae7713a-d58d-43a4-9fc0-18eef2f02ea7.png" style="max-width: 70%;">
</p>

* with Manjaro i3wm Xresources:

<p align="center">
<img src="https://user-images.githubusercontent.com/89019438/260228869-4163230d-2f5a-41a7-9b64-05e50c17dff9.png" style="max-width: 70%;">
</p>
</details>

## WHY ?

I've never really enjoyed using a colorscheme: for me, the ideal setup is the nvim default with my colors defined in Xresources. However many plugins require the use of true colors with `set termguicolors`. The concept of this plugin is to stay faithful to the colors defined in Xresources, but in true colors.

## FEATURES

This plugin aims for simplicity, though I have incorporated a few extra choices:

* **auto_light** feature: useful when Xresources only contains 8 colors
* **palette_overrides**: change palette colors
* **custom_highlight_groups() function**: override or add groups
* **contrast** option: set contrast for colors bg1, bg2, bg3 and fg1
* **treesitter support**

## CONTRIBUTING

This plugin is a work in progress, and there are many things missing! I am more than willing to accept pull requests to help improve it.

## INSTALL

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'martineausimon/nvim-xresources',
  lazy = false,
  priority = 1000,
  config = function()
    --Optional config:
    --require('nvim-xresources').setup({
    --  xresources_path = os.getenv("HOME") .. '/.Xresources',
    --  auto_light = {
    --    enable = true,
    --    value = 0.5,
    --    exclude = {},
    --  },
    --  contrast = 1,
    --  palette_overrides = {},
    --})
    --local C = require('nvim-xresources.colors')
    --require('nvim-xresources').custom_highlight_groups({ })

    vim.cmd('colorscheme xresources')
  end
}
```

add this line in your `init.lua` :

```lua
vim.cmd('colorscheme xresources')
```

## CONFIG

an example setup with Lazy. Pay attention to the order of the elements: `require('nvim-xresources.colors')` must be called after the `setup()` function

```lua
{
  'martineausimon/nvim-xresources',
  lazy = false,
  priority = 1000,
  config = function()
    require('nvim-xresources').setup({
      xresources_path = os.getenv("HOME") .. '/.Xresources',
      auto_light = {
        enable = true,
        value = 0.5,
        exclude = {
          "light_green",
          "light_blue",
        }
      },
      contrast = 0.6,
      palette_overrides = {
        green = "#3CB371",
      },
    })

    local C = require('nvim-xresources.colors')

    require('nvim-xresources').custom_highlight_groups({
      -- link to a existing group :
      pythonBuiltin = "PreProc",
      -- or define highlights :
      pythonFunction = { guifg = C.cyan, guibg = nil, gui = "bold", guisp = nil },
    })
    vim.cmd('colorscheme xresources')
  end
}
```

## USAGE

You can use colors from `nvim-xresources` in other parts of your config. In the following example, I use `nvim-xresources` colors in [nvim-lilypond-suite](https://github.com/martineausimon/nvim-lilypond-suite) config :

```lua
local C = require('nvim-xresources.colors')

require('nvls').setup({
  lilypond = {
    highlights = { 
      lilyVar = { 
        fg = C.blue 
      }
    },
  },
})

```

## CREDITS, INSPIRATION

[gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)  
[nord.nvim](https://github.com/shaunsingh/nord.nvim)  
[xresources-nvim](https://github.com/nekonako/xresources-nvim)  
[nvim-base16](https://github.com/RRethy/nvim-base16)  
