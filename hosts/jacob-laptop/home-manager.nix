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
				../../programs/tmux.nix
				../../programs/vim.nix
				../../programs/vscode.nix
				../../programs/btop.nix
				../../programs/nixvim.nix
				../../programs/git.nix
				../../programs/kitty.nix
				../../programs/direnv.nix
				../../programs/ghostty.nix
				../../programs/gh.nix
			];

			home.packages = [
				pkgs.lua
			];

			programs.home-manager.enable = true;

			home.stateVersion = "24.05";
		};
	};
}
