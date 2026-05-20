{ ... }:
{
	programs.git = {
		enable = true;
		lfs.enable = true;
		settings = {
			user = {
				name = "Jacob Enders";
				email = "jacobenders1@gmail.com";
			};
			signing = {
				format = "ssh";
				key = "~/.ssh/id_ed25519.pub";
				signByDefault = true;
			};
		};
	};
}
