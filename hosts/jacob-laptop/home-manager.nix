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
				pkgs.lua
				pkgs.btop
				pkgs.gh
				pkgs.lm_sensors
				pkgs.discord
			];

			programs.home-manager.enable = true;

			home.stateVersion = "24.05";
		};
	};
}
