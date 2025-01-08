local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemas = {
				kubernetes = "*.{yml,yaml}",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.{yml,yaml}",
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
			},
		},
	},
})
