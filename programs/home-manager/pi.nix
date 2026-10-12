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
      defaultProvider = "mistral";
      defaultModel = "mistral-medium-latest";
      enabledModels = [
        "mistral-small-latest"
        "mistral-medium-latest"
        "mistral-large-latest"
        "mistral-large-4"
        "codestral-latest"
        "zai-glm-5-3"
      ];
    };
  };
}
