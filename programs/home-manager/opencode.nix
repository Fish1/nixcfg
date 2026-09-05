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
        pixel = {
          type = "local";
          command = [ "/home/jacob/Projects/digitales-ai/pixel-mcp/bin/pixel-mcp" ];
          enable = true;
        };
      };
    };
    tui.settings = {
      theme = "tokyonight";
    };

  };
}
