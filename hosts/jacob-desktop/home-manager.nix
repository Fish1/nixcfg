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
				../../programs/librewolf.nix
				nixvim.homeManagerModules.nixvim
			];

			home.packages = [
				pkgs.firefox
				pkgs.inkscape
				pkgs.gimp3
				pkgs.lazygit
				pkgs.lazydocker
				pkgs.lua
				pkgs.ansible
				pkgs.btop
				pkgs.gh
				pkgs.sshpass
				pkgs.lm_sensors
				pkgs.gamescope
				pkgs.telegram-desktop
				pkgs.mangohud
				pkgs.vim
				pkgs.wget
				pkgs.obsidian
				pkgs.discord
				pkgs.vscode
				pkgs.ruby
				pkgs.nordpass
				pkgs.prismlauncher
				pkgs.minecraft-server
			];

			programs.home-manager.enable = true;

			home.stateVersion = "24.05";
		};
	};
}
