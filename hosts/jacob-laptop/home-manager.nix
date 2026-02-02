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
				../../programs/home-manager/eza.nix
				../../programs/home-manager/fish.nix
				../../programs/home-manager/tmux.nix
				../../programs/home-manager/vim.nix
				../../programs/home-manager/vscode.nix
				../../programs/home-manager/btop.nix
				../../programs/home-manager/nixvim.nix
				../../programs/home-manager/git.nix
				../../programs/home-manager/kitty.nix
				../../programs/home-manager/direnv.nix
				../../programs/home-manager/ghostty.nix
				../../programs/home-manager/gh.nix
			];

			home.packages = [
				pkgs.lua
				pkgs.kstars
				pkgs.kdePackages.kcalc
			];

			programs.home-manager.enable = true;

			home.stateVersion = "24.05";
		};
	};
}
