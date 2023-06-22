# Paramount

A minimal colorscheme for Neovim that only puts emphasis on the paramount.

## Screenshots

_Fira Code_ font on light and dark backgrounds, with Ruby code from
[VimColors](vimcolors.com/438/paramount/dark):

![](screenshots/light.png)
![](screenshots/dark.png)

## Installation

With lazy.nvim

```lua
{
    "VKTRenokh/nvim-colors-paramount",
    config = function()
        require("paramount").setup({})

        vim.cmd("colorscheme paramount")
    end
}
```

## Credits

Based on the [pencil][] and [off][] colorschemes.

[pencil]: https://github.com/reedes/vim-colors-pencil
[off]: https://github.com/reedes/vim-colors-off

## Contributions

If you find any problems with this color scheme please post an issue here on
GitHub. If you don't like some specific color, please fork it instead and customize
to your liking. Thanks!

## License

Original license from pencil: [MIT](LICENSE)
