{
	description = "My NixOS";

	nix.settings = {
		substituters = ["https://hyprland.cachix.org"];
		trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
	};

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nixvim.url = "github:nix-community/nixvim";
		nixvim.inputs.nixpkgs.follows = "nixpkgs";

		hyprland.url = "github:hyprwm/Hyprland";
	};

	outputs = { self, nixpkgs, home-manager, nixvim } @attrs : {
		nixosConfigurations = {

			jacob-laptop = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = attrs;
				modules = [
					./hosts/jacob-laptop/configuration.nix
					home-manager.nixosModules.home-manager
					nixvim.nixosModules.nixvim
				];
			};

			jacob-desktop = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = attrs;
				modules = [
					./hosts/jacob-desktop/configuration.nix
					home-manager.nixosModules.home-manager
					nixvim.nixosModules.nixvim
				];
			};

		};
	};
}
