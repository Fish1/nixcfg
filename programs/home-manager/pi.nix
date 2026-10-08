{ pkgs, config, ... }: {
  programs.pi-coding-agent = {
    enable = true;
    configDir = "${config.xdg.configHome}/pi/agent";
    extraPackages = [
      pkgs.nodejs
    ];
    settings = {
      packages = [
        "https://github.com/carderne/pi-nvim"
      ];
    };
  };
}
