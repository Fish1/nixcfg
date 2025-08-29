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
	services.spice-webdavd.enable = true;

	virtualisation.docker.enable = true;

  networking.hostName = "jacob-laptop";

	system.stateVersion = "23.11";
}
