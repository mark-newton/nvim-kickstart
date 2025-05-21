# Setup Notes

## Overview
- This repo is a fork of https://github.com/nvim-lua/kickstart.nvim
- Most of the kickstart config resides in init.lua with some extras in lua/kickstart
- Aim to keep kickstart config the same then use overrides for custom keymaps, options and plugins

## Git Commands
- `git remote -v`: shows repo setup
- `git fetch upstream`: fetch latest chanegs from upstream without merge
- `git merge upstream/master`: merge the upstream changes from master branch

## Changes
- Default plugins
    - kickstart includes a set of default plugins with common settings (eg. LSP, auto-complete)
    - changes to default plugins need to be done in the main init.lua, so this could create merge conflicts
- Keymaps and options
    - init.lua modified to import options from lua/custom/options.lua
    - it does this just before the lazy plugins section as keymaps & options should be set before then
- Plugins:
    - init.lua is setup to import plugins from lua/custom/plugins
    - it should import any file in this directory, make sure each file returns a lua table

