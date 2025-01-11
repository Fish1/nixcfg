{ pkgs, ... }:
{
  imports = [
		./hardware-configuration.nix
		./home-manager.nix
		../../programs/steam.nix
		../../programs/fish.nix
		../../users/jacob.nix
	];

	nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
	boot.extraModprobeConfig = "options hid_apple fnmode=1";

  networking.hostName = "jacob-desktop";
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
	hardware = {
		graphics = {
			enable = true;
			enable32Bit = true;
		};
		amdgpu.amdvlk = {
			enable = true;
			support32Bit.enable = true;
		};
	};

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  fonts.packages = [
		pkgs.nerd-fonts.jetbrains-mono
  ];

  services.flatpak.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
