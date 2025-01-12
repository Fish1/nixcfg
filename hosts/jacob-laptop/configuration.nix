{ config, pkgs, home-manager, nixvim, ... }:

{
  imports = [
		./hardware-configuration.nix
		./home-manager.nix
		../../programs/fish.nix
		../../users/jacob.nix
		../../common.nix
	];

  networking.hostName = "jacob-laptop";

	system.stateVersion = "23.11";
}
