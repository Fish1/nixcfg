{ pkgs, lib, ... }: {
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
            (lib.getExe pkgs.mcp-nixos)
          ];
        };
        git = {
          enabled = true;
          type = "local";
          command = [
            (lib.getExe pkgs.mcp-server-git)
          ];
        };
        fetch = {
          enabled = true;
          type = "local";
          command = [
            (lib.getExe pkgs.mcp-server-fetch)
          ];
        };
      };
    };
    tui.settings = {
      theme = "tokyonight";
    };

  };
}
