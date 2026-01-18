{ pkgs, ... }:
{
	nix.settings = {
		download-buffer-size = 524288000;
	};

	# allow unfree software
	nixpkgs.config.allowUnfree = true;

	# bootloader
	boot.loader.grub.efiSupport = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernelPackages = pkgs.linuxPackages_latest;
	boot.initrd.kernelModules = [ "amdgpu" ];

	boot.loader.systemd-boot = {
		enable = true;
		memtest86.enable = true;
	};

	# locale
	time.timeZone = "America/New_York";
	i18n.defaultLocale = "en_US.UTF-8";

	# graphics
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
