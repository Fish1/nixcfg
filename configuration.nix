{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  networking.hostName = "nixos";
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
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
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

  home-manager.users.jacob = { pkgs, ... }:
  let 
    nixvim = import (builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
      ref = "nixos-23.11";
    });
  in
  {
    imports = [
      nixvim.homeManagerModules.nixvim
    ];

    home.packages = [
      pkgs.firefox
      pkgs.inkscape
      # pkgs.indi-full
      # pkgs.indilib
      pkgs.kstars
      pkgs.libsForQt5.breeze-icons
      pkgs.gimp
      pkgs.siril
      pkgs.lazygit
      pkgs.lazydocker
      pkgs.go
      pkgs.nodejs_18
      pkgs.lua
      pkgs.rustc
      pkgs.cargo
      pkgs.rust-analyzer
      pkgs.gcc
      pkgs.ansible
    ];

    programs.home-manager.enable = true;

    programs.nixvim = {
      enable = true;
      colorschemes.tokyonight.enable = true;
      options = {
        number = true;
	relativenumber = true;
      };

      plugins = {
	lualine.enable = true;
	bufferline.enable = true;
        treesitter.enable = true;
	neo-tree.enable = true;
	fidget.enable = true;

	lsp = {
	  enable = true;
	  servers = {
	    lua-ls.enable = true;
	    tsserver.enable = true;
	    rust-analyzer.enable = true;
	  };
	  keymaps.lspBuf = {
	    K = "hover";
	    gD = "references";
	    gd = "definition";
	    gi = "implementation";
	    gt = "type_definition";
	  };
	};

	nvim-cmp = {
	  enable = true;
	  autoEnableSources = true;
	  sources = [
	    { name = "nvim_lsp"; }
	    { name = "path"; }
	    { name = "buffer"; }
	  ];
	};
      };
    };

    programs.git = {
      enable = true;
      userName = "Jacob Enders";
      userEmail = "jacobenders1@gmail.com";
      lfs.enable = true;
    };

    programs.kitty = {
      enable = true;
      theme = "Tokyo Night";
      settings = {
      	font_family = "JetBrainsMono NFM";
	wayland_titlebar_color = "#000000";
      };
    };

    programs.tmux = {
      enable = true;
      shell = "${pkgs.fish}/bin/fish";
      terminal = "tmux-256color";
    };

    home.stateVersion = "23.11";
  };

  environment.systemPackages = with pkgs; [
    pkgs.vim
    pkgs.wget

    pkgs.vscode
    pkgs.discord
    pkgs.steam
  ];

  programs.fish.enable = true;

  programs.steam.enable = true;
  programs.steam.remotePlay.openFirewall = true;
  programs.steam.dedicatedServer.openFirewall = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  services.flatpak.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
