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
		};
	};
}
