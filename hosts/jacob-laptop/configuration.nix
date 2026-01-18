{ ... }: {
  imports = [
		./hardware-configuration.nix
		./home-manager.nix
		../../common.nix
		../../programs/steam.nix
		../../users/jacob.nix
	];

	programs.fish.enable = true;

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
