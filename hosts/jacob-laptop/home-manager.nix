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
				../../programs/ghostty.nix
				nixvim.homeModules.nixvim
			];

			home.packages = [
				pkgs.lua
				pkgs.btop
				pkgs.gh
				pkgs.vim
				pkgs.vscode
			];

			programs.home-manager.enable = true;

			home.stateVersion = "24.05";
		};
	};
}
