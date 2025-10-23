return {
	"goolord/alpha-nvim",
	requires = {"kyazdani42/nvim-web-devicons"},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		math.randomseed(os.time())

		local function footer()
			local stats = require("lazy").stats()
			local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
			local version = vim.version()
			local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

			return datetime .. "   " .. stats.loaded .. "/" .. stats.count .. " plugins" .. nvim_version_info
		end

		local logo = {

			"                                                                                        ",
			"                                            ██████████                                  ",
			"                                      ░░  ██░░░░░░░░░░██                                ",
			"                                        ██░░░░░░░░░░░░░░██                              ",
			"                                        ██░░░░░░░░████░░██████████                      ",
			"                            ██          ██░░░░░░░░████░░██▒▒▒▒▒▒██                      ",
			"                          ██░░██        ██░░░░░░░░░░░░░░██▒▒▒▒▒▒██                      ",
			"                          ██░░░░██      ██░░░░░░░░░░░░░░████████                        ",
			"                        ██░░░░░░░░██      ██░░░░░░░░░░░░██                              ",
			"                        ██░░░░░░░░████████████░░░░░░░░██                                ",
			"                        ██░░░░░░░░██░░░░░░░░░░░░░░░░░░░░██                              ",
			"                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
			"                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
			"                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
			"                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
			"                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                            ",
			"                        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                              ",
			"                          ██░░░░░░░░░░░░░░░░░░░░░░░░░░██                                ",
			"                            ██████░░░░░░░░░░░░░░░░████                                  ",
			"                                  ████████████████                                      ",
			"                                                                                        ",
			"                                                                                        ",
			"                                                                                        ",
			"                                                                                        ",
			"                                                                                        ",
		}


		dashboard.section.header.val = logo
		dashboard.section.header.opts.hl = "String"

		dashboard.section.buttons.val = {
			dashboard.button("<Leader>ff", "  File Explorer"),
			dashboard.button("<Leader>fo", "  Find File"),
			dashboard.button("<Leader>fw", "  Find Word"),
			dashboard.button("<Leader>ps", "  Update plugins"),
			dashboard.button("q", "  Quit", ":qa<cr>")
		}

		dashboard.section.footer.val = footer()
		dashboard.section.footer.opts.hl = "Constant"

		-- Center everything
		dashboard.opts.opts.noautocmd = true
		dashboard.section.header.opts.position = "center"
		dashboard.section.buttons.opts.position = "center"
		dashboard.section.footer.opts.position = "center"
		dashboard.section.buttons.opts.spacing = 1

		alpha.setup(dashboard.opts)

		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
	end
}
