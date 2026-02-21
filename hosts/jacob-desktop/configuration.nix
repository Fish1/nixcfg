{ millennium, ... }:
{
	# nixpkgs.overlays = [
	#		millennium.overlays.default
	# ];

  imports = [
		../../common.nix
		../../users/jacob.nix
		./hardware-configuration.nix
		./home-manager.nix

		# shell
		../../programs/nixos/fish.nix

		# utility
		../../programs/nixos/appimage.nix
	
		# games
		../../programs/nixos/steam.nix
		../../programs/nixos/gamescope.nix

	];

	boot.extraModprobeConfig = "options hid_apple fnmode=1";
	
	# services.displayManager.sddm.enable = true;
	# services.displayManager.sddm.wayland.enable = true;
	
	services.displayManager.plasma-login-manager.enable = true;
	services.desktopManager.plasma6.enable = true;

	nix.optimise = {
		automatic = true;
	};

	nix.gc = {
		automatic = true;
		options = "--delete-older-than 30d";
	};

  networking.hostName = "jacob-desktop";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.flatpak.enable = true;
	services.fwupd.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";
}
