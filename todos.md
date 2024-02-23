# Things to improve

- nvim
    - search and replace https://github.com/nvim-pack/nvim-spectre
    - write makefile keybindings for AoC
    - cmp suggestions to be triggered manually https://www.reddit.com/r/neovim/s/F2xCHX2unu
    - conform.nvim (manage linters and formatters) https://www.youtube.com/watch?v=y1WWOaLCNyI
    - haskell language server is constantly logging errors about heap size
- iterm2: adopt https://gitlab.com/gnachman/iterm2/-/issues/6602

# Known issues

- nvim
    - Kotlin LSP gets attached to Gradle projects, but not to standalone Kotlin source files. I've read quite a few Reddit threads, and it seems that it may work decently using Coc.vim or LanguageClient instead the native nvim LSP config.
        - https://github.com/fwcd/kotlin-language-server/tree/eee8afa9b6b92c4c5ae445823b3719818d595ec1?tab=readme-ov-file#figuring-out-the-dependencies

