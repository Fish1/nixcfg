{ pkgs, ... }:
{
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

		extraPlugins = [(
			pkgs.vimUtils.buildVimPlugin {
				name = "love2d";
				src = pkgs.fetchFromGitHub {
					owner = "S1M0N38";
					repo = "love2d.nvim";
					rev = "a290eae5170246d71cd26dde76a1c0efeb4bd2fb";
					hash = "sha256-8sLDGW2hyyfCk4IaN+s5vsHSlRsKKl1XsFE7I/zFRmU=";
				};
			}
		)];

		extraConfigLuaPost = ''
			require('love2d').setup({})
		'';

		plugins = {
			lualine.enable = true;
			bufferline.enable = true;
			neo-tree.enable = true;
			fidget.enable = true;
			lsp-format.enable = true;
			lspconfig.enable = true;
			luasnip.enable = true;
			trouble.enable = true;
			telescope.enable = true;
			web-devicons.enable = true;
			hex.enable = true;

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
					nixd.enable = true;
					clangd.enable = true;
					terraformls.enable = true;
					zls.enable = true;
					gleam.enable = true;
					ols.enable = true;
					pyright.enable = true;
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
					ts_ls = {
						enable = true;
						onAttach.function = ''
							require("lsp-format").on_attach(client, bufnr)
						'';
					};
					eslint.enable = true;
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
					lua_ls = {
						enable = true;
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
}
