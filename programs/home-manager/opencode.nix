{ pkgs, lib, ... }: {
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;

		context = "Always check the internet for documentation.";

    settings = {
      autoupdate = false;
      lsp = true;
      formatter = true;
      permission = {
        bash = "ask";
        edit = "ask";
        skill = "ask";

        grep = "allow";
        glob = "allow";
        webfetch = "allow";
        lsp = "allow";
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
