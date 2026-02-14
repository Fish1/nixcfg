{ home-manager, nixvim, ... } :
{
	home-manager = {

		extraSpecialArgs = {
			inherit home-manager nixvim;
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
				../../programs/home-manager/vim.nix
				../../programs/home-manager/vscode.nix
				../../programs/home-manager/gh.nix
				../../programs/home-manager/git.nix
				../../programs/home-manager/lazygit.nix
				../../programs/home-manager/lazydocker.nix

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

				# programming
				pkgs.lua
				pkgs.ansible
				pkgs.sshpass

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
