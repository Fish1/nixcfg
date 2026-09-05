{ ... }: {
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;
    settings = {
      autoupdate = true;
      lsp = true;
      formatter = true;
      permission = {
        bash = "ask";
        edit = "ask";
        grep = "allow";
        glob = "allow";
        webfetch = "allow";

        lsp = "allow";
        skill = "ask";
        question = "allow";
      };
      mcp = {
        nixos = {
          enabled = true;
          type = "local";
          command = [
            "nix"
            "run"
            "github:utensils/mcp-nixos"
            "--"
          ];
        };
      };
    };
    tui.settings = {
      theme = "tokyonight";
    };

  };
}
