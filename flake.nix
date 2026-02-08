{
	description = "My NixOS";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nixvim.url = "github:nix-community/nixvim";
		nixvim.inputs.nixpkgs.follows = "nixpkgs";

		millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
	};

	outputs = { self, nixpkgs, home-manager, nixvim, millennium, ... } @attrs: {
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
