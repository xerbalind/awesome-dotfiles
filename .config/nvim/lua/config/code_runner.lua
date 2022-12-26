local cmp_status_ok, runner = pcall(require, "code_runner")
if not cmp_status_ok then
  vim.notify("Code Runner not found!!")
  return
end

runner.setup({
  term = {
    size = 15,
    mode = "startinsert",
  },
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python",
    javascript = "node",
    sh = "./$fileName",
    c = "cd $dir && gcc $fileName && ./a.out && rm a.out",
  },
  project = {
  },
})
