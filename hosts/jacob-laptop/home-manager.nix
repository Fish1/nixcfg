{ config, pkgs, home-manager, nixvim, ... } :

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
				pkgs.mangohud
			];

			programs.home-manager.enable = true;

			home.stateVersion = "24.05";
		};
	};
}
