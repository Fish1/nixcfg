{ config, pkgs, home-manager, nixvim, ... }:

{
  imports = [
		./hardware-configuration.nix
		./home-manager.nix
	];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
	boot.extraModprobeConfig = "options hid_apple fnmode=1";

  networking.hostName = "jacob-laptop";
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

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
  
  nixpkgs.config.allowUnfree = true;

  users.users.jacob = {
    isNormalUser = true;
    description = "Jacob Enders";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };

  environment.systemPackages = [
		pkgs.vim
		pkgs.wget
  ];

  programs.fish.enable = true;

  fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
  ];

  services.flatpak.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
