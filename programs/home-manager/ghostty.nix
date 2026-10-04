{ ... }: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "TokyoNight";
      font-family = "JetBrainsMono Nerd Font";
    };
  };
}
