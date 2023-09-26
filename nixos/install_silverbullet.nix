{ pkgs }:

pkgs.writeShellApplication {
	name = "install_silverbullet";

	runtimeInputs = [ pkgs.deno ];
	
	text = ''
	deno install -f --name silverbullet --unstable -A https://get.silverbullet.md
	ln -s ~/.deno/bin/silverbullet ~/.nix-profile/bin/silverbullet
	'';
}
