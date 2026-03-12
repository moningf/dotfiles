return {
	{
		"moningf/nvim_runner",
		name = "nvim_runner",
		keys = {
			{"<leader>r",
			function()
				require("nvim_runner").run()
			end,
			desc = "Toggle Run Terminal"},

		-- 	{"<leader>sn",
		-- 	function()	
		-- 		require("notify")("My super important message")
		-- 	end,
		-- 	desc = "send notify"
		-- },

		},
	}
}
