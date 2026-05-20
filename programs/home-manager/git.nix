{ ... }:
{
	programs.git = {
		enable = true;
		lfs.enable = true;
		settings = {
			user = {
				name = "Jacob Enders";
				email = "noreply@example.com";
			};
			signing = {
				signByDefault = true;
			};
		};
	};
}
