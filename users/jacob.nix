{ pkgs, ... }:
{
	users.users.jacob = {
		isNormalUser = true;
		description = "Jacob Enders";
		extraGroups = [ "networkmanager" "wheel" "docker" ];
		shell = pkgs.fish;
	};
}
