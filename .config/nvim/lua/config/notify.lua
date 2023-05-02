local status_ok, notify = pcall(require, "notify")
if not status_ok then
	vim.notify("notify not found!!")
	return
end

notify.setup({
  timeout = 1500,
  stages = 'static',
})
