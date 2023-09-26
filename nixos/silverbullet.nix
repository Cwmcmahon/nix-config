{ pkgs }:

pkgs.writeShellApplication {
	name = "install_silverbullet";

	runtimeInputs = [ deno ];
	
	text = ''
	deno install -f --name silverbullet --unstable -A
	'';
};
