{ pkgs, ... }:
{
	# bootloader
	boot.loader.systemd-boot.enable = true;
	boot.loader.grub.efiSupport = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernelPackages = pkgs.linuxPackages_latest;
	boot.initrd.kernelModules = [ "amdgpu" ];

	# locale
	time.timeZone = "America/New_York";
	i18n.defaultLocale = "en_US.UTF-8";

	# graphics
	services.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;
	hardware = {
		graphics = {
			enable = true;
			enable32Bit = true;
		};
	};

	# printing
	services.printing.enable = true;
	
	# audio
	security.rtkit.enable = true;
	services.pipewire.enable = true;

	# networking
	networking.networkmanager.enable = true;

	# fonts
	fonts.packages = [
		pkgs.nerd-fonts.jetbrains-mono
  ];

	# nix settings
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
