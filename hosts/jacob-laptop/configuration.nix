{ ... }:
{
  imports = [
		./hardware-configuration.nix
		./home-manager.nix
		../../programs/fish.nix
		../../users/jacob.nix
		../../common.nix
	];
  
  services.flatpak.enable = true;

	virtualisation.docker.enable = true;
	
	nix.gc = {
		automatic = true;
		options = "--delete-older-than 30d";
	};

  networking.hostName = "jacob-laptop";

	system.stateVersion = "23.11";
}
