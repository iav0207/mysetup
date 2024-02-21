return {
    'mrcjkb/haskell-tools.nvim',
    version = '^3', -- Recommended
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    -- To fix renaming I need to set
    -- haskell.plugin.rename.config.crossModule": true
    -- but idk where exactly.
}
