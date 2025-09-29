return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup()

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })
		-- Exact search keymaps
		-- Exact filename search
		keymap.set("n", "<leader>fe", function()
			require("telescope.builtin").find_files({
				prompt_title = "Exact File Search",
				search_file = vim.fn.input("Exact filename: "),
			})
		end, { desc = "Exact file search in cwd" })

		-- Exact content search (using ripgrep fixed strings)
		keymap.set("n", "<leader>ge", function()
			require("telescope.builtin").live_grep({
				additional_args = function()
					return { "--fixed-strings" }
				end,
				prompt_title = "Exact content search",
			})
		end, { desc = "Exact content search in cwd" })
	end,
}
