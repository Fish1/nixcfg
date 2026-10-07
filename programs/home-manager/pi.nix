{ ... }: {
  programs.pi-coding-agent = {
    enable = true;
    settings = {
      packages = [
        "https://github.com/carderne/pi-nvim"
      ];
    };
  };
}
