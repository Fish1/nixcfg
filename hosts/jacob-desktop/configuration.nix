{ ... }:
{
  imports = [
		../../common.nix
		./hardware-configuration.nix
		./home-manager.nix
		../../programs/steam.nix
		../../programs/fish.nix
		../../users/jacob.nix
	];

	nixpkgs.config.allowUnfree = true;

  networking.hostName = "jacob-desktop";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.flatpak.enable = true;
  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";
}
