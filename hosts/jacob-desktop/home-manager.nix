{ home-manager, nixvim, ... } :
{
	home-manager = {

		extraSpecialArgs = {
			inherit home-manager nixvim;
		};

		users.jacob = { pkgs, nixvim, ... }: {
			
			nixpkgs.config.allowUnfree = true;

			imports = [
				../../programs/tmux.nix
				../../programs/nixvim.nix
				../../programs/git.nix
				../../programs/kitty.nix
				../../programs/direnv.nix
				nixvim.homeManagerModules.nixvim
			];

			home.packages = [
				# utilities
				pkgs.wget
				pkgs.btop

				# programming
				pkgs.lazygit
				pkgs.lazydocker
				pkgs.vscode
				pkgs.vim
				pkgs.gh
				pkgs.lua
				pkgs.ansible
				pkgs.sshpass

				# communications
				pkgs.firefox
				pkgs.brave
				pkgs.discord
				pkgs.telegram-desktop

				# games
				pkgs.lm_sensors
				pkgs.gamescope
				pkgs.mangohud
				pkgs.prismlauncher
				pkgs.nexusmods-app-unfree
				pkgs.dolphin-emu
				pkgs.godot

				# art
				pkgs.inkscape
				pkgs.gimp3
				pkgs.obsidian
			];

			programs.home-manager.enable = true;

			home.stateVersion = "24.05";
		};
	};
}
