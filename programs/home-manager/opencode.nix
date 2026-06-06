{ ... }: {
	programs.opencode = {
		enable = true;
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
		};
		tui.settings = {
			theme = "tokyonight";
		};
	};
}
