{ ... }:
{
	programs.kitty = {
		enable = true;
		themeFile = "tokyo_night_night";
		settings = {
			font_family = "JetBrainsMono NFM";
			wayland_titlebar_color = "#000000";
		};
		keybindings = {
			"ctrl+shift+t" = "new_tab_with_cwd";
		};
	};
}
