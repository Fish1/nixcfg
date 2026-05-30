{ home-manager, nixvim, nixpkgs-unfree, ... } :
{
	home-manager = {

		extraSpecialArgs = {
			inherit home-manager nixvim nixpkgs-unfree;
		};

		users.jacob = { pkgs, nixvim, ... }: {
			
			nixpkgs.config.allowUnfree = true;

			imports = [
				nixvim.homeModules.nixvim

				# shell
				../../programs/home-manager/fish.nix
				../../programs/home-manager/eza.nix
				../../programs/home-manager/nix-your-shell.nix
			
				# utilities
				../../programs/home-manager/direnv.nix
				../../programs/home-manager/tmux.nix
				../../programs/home-manager/btop.nix

				# notes
				../../programs/home-manager/obsidian.nix

				# terminals
				../../programs/home-manager/kitty.nix
				../../programs/home-manager/ghostty.nix

				# code
				../../programs/home-manager/nixvim.nix
                                # ../../programs/home-manager/neovim.nix
				../../programs/home-manager/ripgrep.nix
				../../programs/home-manager/fd.nix
				../../programs/home-manager/vim.nix
				# ../../programs/home-manager/vscode.nix
				../../programs/home-manager/gh.nix
				../../programs/home-manager/git.nix
				../../programs/home-manager/lazygit.nix
				../../programs/home-manager/lazydocker.nix
				../../programs/home-manager/gemini-cli.nix
				../../programs/home-manager/opencode.nix

				# communications
				../../programs/home-manager/discord.nix
				../../programs/home-manager/firefox.nix

				# games
				../../programs/home-manager/mangohud.nix

			];

			home.packages = [
				# utilities
				pkgs.wget
				pkgs.simplescreenrecorder
				pkgs.qbittorrent
        pkgs.lsof
				pkgs.unzip

				# programming
				pkgs.lua
				pkgs.ansible
				pkgs.sshpass
				pkgs.tree-sitter
				pkgs.devenv

				# communications
				pkgs.telegram-desktop

				# games
				pkgs.lm_sensors
				pkgs.prismlauncher

				# art
				pkgs.inkscape
				pkgs.gimp3
			];

			programs.home-manager.enable = true;

			home.stateVersion = "24.05";
		};
	};
}
