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
		["~/Desktop/Java-Project/02108398"] = {
			name = "Java-Project",
			description = "A javafx project",
			command = "mvn clean javafx:run",
		},
		["~/Documents/Rofi/rofi-chief"] = {
			name = "Rofi chief",
			description = "a rofi script",
			command = "rofi -show chief -modi chief:./chief",
		},
		["~/Documents/Informatica/funcprog/werkcollege/memory"] = {
			name = "Memory",
			description = "A memory game written in haskell",
			command = "stack run",
		},
	},
})
