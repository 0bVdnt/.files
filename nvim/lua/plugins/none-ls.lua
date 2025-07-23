return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- Formatters & linters for mason to install
		require("mason-null-ls").setup({
			ensure_installed = {
				-- Existing formatters & linters
				"prettier", -- TS/JS formatter
				"stylua", -- Lua formatter
				"eslint_d", -- TS/JS linter
				"shfmt", -- Shell formatter
				"checkmake", -- Linter for Makefiles
				"ruff", -- Python linter
				--	"ruff_format", -- Python formatter

				-- C/C++
				"clang-format", -- C/C++/CUDA formatter
				--				"clang-tidy", -- C/C++ linter

				-- Rust
				--	"rustfmt", -- Rust formatter
				-- "clippy", -- Rust linter (requires `rustup component add clippy`)

				-- Zig
				-- "zigfmt", -- Zig formatter (built-in with Zig compiler)

				-- Odin
				-- "odin", -- Odin formatter (built-in with Odin compiler)

				-- CUDA
				"clang-format", -- CUDA uses Clang format

				-- Assembly
				--	"nasmfmt", -- NASM formatter (if available)
				--	"nasm", -- NASM syntax checker
			},
			automatic_installation = true,
		})

		-- Require `null-ls` (if still using it)
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		-- Configure formatters & linters
		local sources = {
			-- Existing linters & formatters
			diagnostics.checkmake,
			formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
			formatting.stylua,
			formatting.shfmt.with({ args = { "-i", "4" } }),
			formatting.terraform_fmt,
			require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
			require("none-ls.formatting.ruff_format"),

			-- C/C++
			formatting.clang_format,
			--			diagnostics.clang_tidy,

			-- Rust
			--			formatting.rustfmt,
			-- diagnostics.clippy,

			-- Zig
			-- formatting.zigfmt,

			-- Odin
			-- formatting.odin, -- Built-in Odin formatter

			-- CUDA
			formatting.clang_format, -- CUDA uses Clang format
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			-- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
			sources = sources,
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
