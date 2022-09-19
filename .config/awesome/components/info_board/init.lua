local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")

local buildin = require("components.info_board.buildin")

local board = {}

-- Create a new instance of a popup board.
-- @tparam[opt] boolean args.init_on_start Initializes the popup too when board is created.
-- @tparam[opt] color args.bg Board background color
-- @tparam[opt] color args.fg Board foreground color
-- @tparam[opt] boolean args.homogeneous Wether all coordinates in board grid have same size.
-- @return board instance.
function board.new(args)
  myargs = args or {}

  local instance = gears.object()

  instance.bg = myargs.bg or beautiful.bg_normal
  instance.fg = myargs.fg or beautiful.fg_normal
  instance.homogeneous = myargs.homogeneous or true
  instance.visible = false -- This is mainly for the widget cards to know when board is visible.

  -- Create a popup widget with some helper functions.
  function instance:_create_popup()

    -- The layout of the popup: a grid
    local grid = wibox.widget {
            homogeneous = self.homogeneous,
            spacing = 30,
            expand = true,
            min_cols_size = 20,
            min_rows_size = 10,
            layout = wibox.layout.grid,
    }

    -- Here is the actual creation of the popup.
    local mypopup = awful.popup {
        widget = grid,
        ontop = true,
        bg = self.bg,
        fg = self.fg,
        placement = awful.placement.centered,
        visible = false, -- Start with non-visible
        border_width = 20,
        border_color = self.bg
    }

    function mypopup.show()
      mypopup.visible = true
    end

    function mypopup.hide()
      mypopup.visible = false
      if mypopup.keygrabber then
        awful.keygrabber.stop(mypopup.keygrabber)
        mypopup.keygrabber = nil
      end
    end

    return mypopup

  end

  -- Initializes popup if it doesnt exist already.
  function instance:init_popup_if_not_exist()
    if not self.popup then
      self.popup = self:_create_popup()
    end
  end

  -- Show the board: basically makes popup visible and runs a keygrabber.
  function instance:show()
    self:init_popup_if_not_exist()

    self.visible = true
    self.popup.show()

    self.popup.keygrabber = awful.keygrabber.run(function(_,key,event)
      if event == "release" then return end
      if key then self:hide() end
    end)

    self:emit_signal("show")

  end

  -- Hides the board: basically hides popup. 
  function instance:hide()
    self:init_popup_if_not_exist()

    self.visible = false
    self.popup.hide()

    self:emit_signal("hide")

  end

  -- if true, popup is initialized when board is created. Then no hiccup on first show.
  if myargs.init_on_start then
    instance:init_popup_if_not_exist()
  end

  return instance

end

-- Returns board. 
local function get_board()
  if not board.default then 
    board.default = board.new()
  end
  return board.default
end

-- Show board with all different cards/widgets. 
-- @noreturn
function board.show(...)
  get_board():show()
end

-- Hide board.
-- @noreturn
function board.hide()
  get_board():hide()
end


-- Add a widget to board.
-- @tparam Widget|string args.widget Widget name or object to add.
-- @tparam[opt] int args.rows The row in board grid to add widget.
-- @tparam[opt] int args.col The colum in board grid to add widget.
-- @tparam[opt] int args.row_span The row span for widget.
-- @tparam[opt] int args.col_span The colum span for widget.
-- @tparam[opt] table args.opts Options for widget when using string.
-- @noreturn
function board.add_widget(args)
  local board = get_board()

  board:init_popup_if_not_exist()

  local widget = args.widget
  if type(args.widget) == "string" then 
    args.opts = args.opts or {}
    args.opts.parent = board
    widget = buildin.get_widget(args.widget,args.opts) 
  end

  local grid = board.popup.widget
  if args.row and args.col then -- Add widget at specific coordinate.
    grid:add_widget_at(widget,args.row,args.col,args.row_span or 1,args.col_span or 1)
  else
    grid:add(widget) -- Just add widget at first empty place.
  end
end


return board
