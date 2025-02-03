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

	boot.extraModprobeConfig = "options hid_apple fnmode=1";

	nix.optimise = {
		automatic = true;
	};

	nix.gc = {
		automatic = true;
		options = "--delete-older-than 30d";
	};

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
