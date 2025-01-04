{ config, pkgs, home-manager, nixvim, ... } :

{
	home-manager = {

		extraSpecialArgs = {
			inherit home-manager nixvim;
		};

		users.jacob = { pkgs, nixvim, ... }: {
			
			nixpkgs.config.allowUnfree = true;

			imports = [
				nixvim.homeManagerModules.nixvim
			];

			home.packages = [
				pkgs.firefox
				pkgs.inkscape
				pkgs.gimp
				pkgs.lazygit
				pkgs.lazydocker
				pkgs.lua
				pkgs.ansible
				pkgs.btop
				pkgs.gh
				pkgs.sshpass
				pkgs.lm_sensors
				pkgs.gamescope
				pkgs.ngrok
				pkgs.telegram-desktop
			];

			programs.home-manager.enable = true;

			programs.nixvim = {
				enable = true;
				colorschemes.tokyonight.enable = true;
				opts = {
					number = true;
					relativenumber = true;
					list = true;
					tabstop = 2;
					shiftwidth = 2;
					foldmethod = "manual";
				};

				keymaps = [
					{
						action = "<cmd>DapToggleBreakpoint<CR>";
						key = "<Leader>db";
					}
				];

				plugins = {
					lualine.enable = true;
					bufferline.enable = true;
					neo-tree.enable = true;
					fidget.enable = true;
					lsp-format.enable = true;
					luasnip.enable = true;
					trouble.enable = true;
					telescope.enable = true;

					treesitter = {
						enable = true;
						settings = {
							auto_install = true;
							highlight.enable = true;
						};
					};

					lsp = {
						enable = true;
						servers = {
							lua_ls.enable = true;
							terraformls.enable = true;
							zls.enable = true;
							gleam.enable = true;
							ols.enable = true;
							rust_analyzer = {
								enable = true;
								installRustc = false;
								installCargo = false;
								onAttach.function = ''
									require("lsp-format").on_attach(client, bufnr)
								'';
							};
							gopls = {
								enable = true;
								onAttach.function = ''
									require("lsp-format").on_attach(client, bufnr)
								'';
							};
							templ = {
								enable = true;
								onAttach.function = ''
									require("lsp-format").on_attach(client, bufnr)
								'';
							};
							ts_ls.enable = true;
							tailwindcss.enable = true;
							html = {
								enable = true;
								filetypes = ["html"];
							};
							svelte = {
								enable = true;
								onAttach.function = ''
									require("lsp-format").on_attach(client, bufnr)
								'';
							};
						};

						keymaps.lspBuf = {
							K = "hover";
							gD = "references";
							gd = "definition";
							gi = "implementation";
							gt = "type_definition";
							gr = "rename";
						};
					};

					dap = {
						enable = true;
						extensions = {
							dap-ui.enable = true;
							dap-virtual-text.enable = true;
							dap-go.enable = true;
						};
					};

					cmp = {
						enable = true;
						autoEnableSources = true;
						settings = {
							snippet.expand = ''
								function(args)
									require('luasnip').lsp_expand(args.body)
								end
							'';
							sources = [
								{ name = "nvim_lsp"; }
								{ name = "luasnip"; }
								{ name = "path"; }
								{ name = "buffer"; }
							];
							mapping = {
								"<C-Space>" = "cmp.mapping.complete()";
								"<C-d>" = "cmp.mapping.scroll_docs(-4)";
								"<C-e>" = "cmp.mapping.close()";
								"<C-f>" = "cmp.mapping.scroll_docs(4)";
								"<CR>" = "cmp.mapping.confirm({ select = true })";
								"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
								"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
							};
						};
					};
				};
			};

			programs.git = {
				enable = true;
				lfs.enable = true;
				userName = "Jacob Enders";
				userEmail = "jacobenders1@gmail.com";
			};

			programs.kitty = {
				enable = true;
				themeFile = "tokyo_night_night";
				settings = {
					font_family = "JetBrainsMono NFM";
					wayland_titlebar_color = "#000000";
				};
			};

			programs.tmux = {
				enable = true;
				shell = "${pkgs.fish}/bin/fish";
				terminal = "tmux-256color";
			};

			home.stateVersion = "24.05";
		};
	};
}
