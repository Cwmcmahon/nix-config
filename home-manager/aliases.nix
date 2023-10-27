{
	imports = [
	];

	programs.bash.shellAliases = {
		t = "todo.sh -d ~/.config/todo/config";
    daily-todo = ''todo.sh addm "(A) Take meds @home +daily due:$(date +%F)
(A) Brush teeth AM @home +daily due:$(date +%F)
(B) Make bed @home +daily due:$(date +%F)
(B) Set up scene @home +daily due:$(date +%F)
(B) Do dishes @home +daily due:$(date +%F)
(A) Brush teeth PM @home +daily due:$(date +%F)"'';
		commit-notes = ''(cd ~/Documents/workbench/ && git add -A && git commit -am "$(date)")'';
		push-notes = ''(cd ~/Documents/workbench/ && git push)'';
		pull-notes = "(cd ~/Documents/workbench/ && git pull)";
		nix-switch = "sudo nixos-rebuild switch --flake ~/Documents/nix-config/#cwm-nixos";
		hm-switch = "home-manager switch --flake ~/Documents/nix-config/#carterm@cwm-nixos";
		open-notes = "codium ; sleep 2 ; codium ~/Documents/workbench/README.md"
	};
}
