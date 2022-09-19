local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  vim.notify("nvim-navic not found!!")
  return
end

local icons = require "config.icons"

navic.setup {
  icons = {
        File          = " ",
        Module        = " ",
        Namespace     = " ",
        Package       = " ",
        Class         = " ",
        Method        = " ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "練",
        Interface     = "練",
        Function      = " ",
        Variable      = " ",
        Constant      = " ",
        String        = " ",
        Number        = " ",
        Boolean       = "◩ ",
        Array         = " ",
        Object        = " ",
        Key           = " ",
        Null          = "ﳠ ",
        EnumMember    = " ",
        Struct        = " ",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
  },
  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}

local status_ok, palette = pcall(require, "gruvbox.palette")
if not status_ok then
	return
end
--[[ bright_aqua = "#8ec07c", ]]
--[[   bright_blue = "#83a598", ]]
--[[   bright_green = "#b8bb26", ]]
--[[   bright_orange = "#fe8019", ]]
--[[   bright_purple = "#d3869b", ]]
--[[   bright_red = "#fb4934", ]]
--[[   bright_yellow = "#fabd2f", ]]
--[[   dark0 = "#282828", ]]
--[[   dark0_hard = "#1d2021", ]]
--[[   dark0_soft = "#32302f", ]]
--[[   dark1 = "#3c3836", ]]
--[[   dark2 = "#504945", ]]
--[[   dark3 = "#665c54", ]]
--[[   dark4 = "#7c6f64", ]]
--[[   faded_aqua = "#427b58", ]]
--[[   faded_blue = "#076678", ]]
--[[   faded_green = "#79740e", ]]
--[[   faded_orange = "#af3a03", ]]
--[[   faded_purple = "#8f3f71", ]]
--[[   faded_red = "#9d0006", ]]
--[[   faded_yellow = "#b57614", ]]
--[[   gray = "#928374", ]]
--[[   light0 = "#fbf1c7", ]]
--[[   light0_hard = "#f9f5d7", ]]
--[[   light0_soft = "#f2e5bc", ]]
--[[   light1 = "#ebdbb2", ]]
--[[   light2 = "#d5c4a1", ]]
--[[   light3 = "#bdae93", ]]
--[[   light4 = "#a89984", ]]
--[[   neutral_aqua = "#689d6a", ]]
--[[   neutral_blue = "#458588", ]]
--[[   neutral_green = "#98971a", ]]
--[[   neutral_orange = "#d65d0e", ]]
--[[   neutral_purple = "#b16286", ]]
--[[   neutral_red = "#cc241d", ]]
--[[   neutral_yellow = "#d79921" ]]


vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsFunction",      {  fg = palette.neutral_blue})
vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true,  fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true,  fg = "#ffffff"})

