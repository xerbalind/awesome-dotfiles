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
    javascript = "node",
    sh = "./$fileName",
    c = "cd $dir && gcc $fileName && ./a.out && rm a.out",
  },
  project = {
    ["~/Documents/Informatica/multimedia/JPEG"] = {
      name = "JPEG",
      command = "cd JpegEncoder/build && make && cd ../.. && JpegEncoder/build/pract_jpeg"
    },
    ["~/Desktop/ats-os"] = {
      name = "ATS-OS",
      command = "make run"
    },
    ["~/Documents/HPC/vsc_user_docs"] = {
      name = "HPC docs",
      command = "python build.py"
    },
    ["~/Desktop/easystream/"] = {
      name = "Easystream",
      command = "ROCKET_CLI_COLORS=false cargo run"
    }
  },
})
