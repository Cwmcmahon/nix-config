{ pkgs }:

pkgs.writeShellApplication {
	name = "install_silverbullet";

	runtimeInputs = [ pkgs.deno ];
	
	text = ''
	deno install -f --name silverbullet --unstable -A https://get.silverbullet.md
	'';
}
