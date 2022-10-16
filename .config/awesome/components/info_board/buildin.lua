
local naughty = require("naughty")

-- Some build-in widgets 
local ram_widget = require("awesome-wm-widgets/ram-widget.ram-widget")
local weather_widget = require("awesome-wm-widgets/weather-widget.weather")
local volume_widget = require("awesome-wm-widgets/volume-widget.volume")
local cpu_widget = require("awesome-wm-widgets/cpu-widget.cpu-widget")
local battery_widget = require("awesome-wm-widgets/battery-widget.battery")
local fs_widget = require("awesome-wm-widgets/fs-widget.fs-widget")

M = {}

M.widgets = {
  ram = ram_widget,
  weather = weather_widget,
  volume = volume_widget,
  cpu = cpu_widget,
  battery = battery_widget,
  fs = fs_widget,
}

function M.get_widget(name,args)
  local args = args or {}
  if M.widgets[name] ~= nil then
    return M.widgets[name](args)
  end

  naughty.notify({
    preset = naughty.config.presets.critical,
    text="info_board" .. name .. " widget name not found."
  })

end

return M
