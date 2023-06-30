local status_ok, navic = pcall(require, "ats-vim")
if not status_ok then
  vim.notify("ats-vim not found!!")
  return
end

