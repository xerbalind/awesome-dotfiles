

require("dap-python").setup("python")
table.insert(require("dap").configurations.python, {
	type = "python",
	request = "launch",
	name = "My custom launch configuration",
	program = "${file}",
	console = "externalTerminal",
})

