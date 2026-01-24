{ ... }: {
  imports = [
		../../common.nix
		../../users/jacob.nix
		./hardware-configuration.nix
		./home-manager.nix
	
		# shell
		../../programs/nixos/fish.nix

		# games
		../../programs/nixos/steam.nix
	];

  services.flatpak.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;
	services.desktopManager.plasma6.enable = true;

	virtualisation.docker.enable = true;
	
	nix.gc = {
		automatic = true;
		options = "--delete-older-than 30d";
	};

  networking.hostName = "jacob-laptop";

	system.stateVersion = "23.11";
}
