{ pkgs, ... }:
{
	# bootloader
	boot.loader.systemd-boot.enable = true;
	boot.loader.grub.efiSupport = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.initrd.kernelModules = [ "amdgpu" ];
	boot.extraModprobeConfig = "options hid_apple fnmode=1";

	# locale
	time.timeZone = "America/New_York";
	i18n.defaultLocale = "en_US.UTF-8";

	# graphics
	services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.videoDrivers = [ "amdgpu" ];
	hardware = {
		graphics = {
			enable = true;
			enable32Bit = true;
		};
	};

	# audio
	services.printing.enable = true;
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	# networking
	networking.networkmanager.enable = true;

	# fonts
	fonts.packages = [
		pkgs.nerd-fonts.jetbrains-mono
  ];

	# nix settings
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
