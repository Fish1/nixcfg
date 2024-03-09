{ config, pkgs, ... } :

{
	home-manager.users.jacob = { pkgs, ... }:
	let 
		nixvim = import (builtins.fetchGit {
			url = "https://github.com/nix-community/nixvim";
			ref = "nixos-23.11";
		});

		unstable = import <unstable> {};
	in
	{
		imports = [
			nixvim.homeManagerModules.nixvim
		];

		home.packages = [
			pkgs.firefox
			pkgs.inkscape
			# pkgs.indi-full
			# pkgs.indilib
			pkgs.kstars
			pkgs.libsForQt5.breeze-icons
			pkgs.gimp
			pkgs.siril
			pkgs.lazygit
			pkgs.lazydocker
			pkgs.lua
			pkgs.ansible
			pkgs.btop
			pkgs.gh
		];

		programs.home-manager.enable = true;

		programs.nixvim = {
			enable = true;
			colorschemes.tokyonight.enable = true;
			options = {
				number = true;
				relativenumber = true;
				list = true;
				tabstop = 2;
				shiftwidth = 2;
			};

			extraPlugins = with pkgs.vimPlugins; [
				lazygit-nvim
			];

			plugins = {
				lualine.enable = true;
				bufferline.enable = true;
				treesitter.enable = true;
				neo-tree.enable = true;
				fidget.enable = true;
				lsp-format.enable = true;
				luasnip.enable = true;

				lsp = {
					enable = true;
					servers = {
						lua-ls.enable = true;
						zls.enable = true;
						rust-analyzer = {
							enable = true;
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
						tsserver.enable = true;
						tailwindcss.enable = true;
						html.enable = true;
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

				nvim-cmp = {
					enable = true;
					autoEnableSources = true;
					snippet.expand = "luasnip";

					sources = [
						{ name = "nvim_lsp"; }
						{ name = "path"; }
						{ name = "buffer"; }
					];

					mapping = {
						"<CR>" = "cmp.mapping.confirm({ select = true })";
						"<S-Tab>" = {
							action = "cmp.mapping.select_prev_item()";
							modes = [
								"i"
								"s"
							];
						};
						"<Tab>" = {
							action = "cmp.mapping.select_next_item()";
							modes = [
								"i"
								"s"
							];
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
			theme = "Tokyo Night";
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

		home.stateVersion = "23.11";
	};
}
