return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = { "mason-org/mason.nvim" },
			opts = {
				ensure_installed = { "netcoredbg" },
				automatic_installation = true,
			},
		},
	},
	keys = {
		{ "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
		{ "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
		{ "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
		{ "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
		{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
		{ "<leader>du", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.adapters.coreclr = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
			args = { "--interpreter=vscode" },
		}

		-- Project-local .nvim.lua files set vim.g.dotnet_debug = { dll, cwd, urls }
		-- `urls` is the raw ASPNETCORE_URLS value, e.g. the same string as the
		-- launchSettings.json profile you'd normally run with `dotnet run --launch-profile`
		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "dotnet build + launch (vim.g.dotnet_debug)",
				request = "launch",
				cwd = function() return vim.fn.expand(vim.g.dotnet_debug.cwd) end,
				env = function()
					return {
						ASPNETCORE_ENVIRONMENT = "Development",
						ASPNETCORE_URLS = vim.g.dotnet_debug.urls,
					}
				end,
				program = function()
					local cfg = vim.g.dotnet_debug
					assert(cfg, "vim.g.dotnet_debug not set - define it in a project-local .nvim.lua")

					local cwd = vim.fn.expand(cfg.cwd)
					vim.notify("Building " .. cwd .. "...", vim.log.levels.INFO)
					local result = vim.system({ "dotnet", "build" }, { cwd = cwd }):wait()
					if result.code ~= 0 then
						vim.notify(
							"dotnet build failed:\n" .. (result.stdout or "") .. (result.stderr or ""),
							vim.log.levels.ERROR
						)
						error("dotnet build failed, see :messages")
					end

					return vim.fn.expand(cfg.dll)
				end,
			},
		}

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
