-- jdtls LSP is being handled by nvim-jdtls
local jdtls_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/bin/jdtls")
local config = {
	cmd = { jdtls_bin },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
