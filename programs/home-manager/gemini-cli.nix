{ ... }: {
	programs.gemini-cli = {
		enable = true;
		settings = {
			ui = {
				theme = "Tokyo Night";
			};
			general = {
				vimMode = true;
				previewFeatures = true;
			};
		};
	};
}
