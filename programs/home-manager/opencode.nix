{ ... }: {
	programs.opencode = {
		enable = true;
		settings = {
			autoupdate = true;
		};
		tui.settings = {
			theme = "tokyonight";
		};
	};
}
