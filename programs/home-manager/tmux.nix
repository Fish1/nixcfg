{ pkgs, ... }:
{
	programs.tmux = {
		enable = true;
		shell = "${pkgs.fish}/bin/fish";
		terminal = "tmux-256color";
		escapeTime = 10;
		focusEvents = true;
	};
}
