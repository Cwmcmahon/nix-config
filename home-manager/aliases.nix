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
		commit-notes = ''(cd ~/Documents/my_notes/ && git add -A && git commit -am "$(date)")'';
		push-notes = ''(cd ~/Documents/my_notes/ && git push private private_notes)'';
		pull-notes = "(cd ~/Documents/my_notes/ && git pull private private_notes)";
		open-notes = "codium ~/Documents/my_notes/ && sleep 2 && codium ~/Documents/my_notes/README.md";
		quick-note = "kak ~/Documents/my_notes/quicknote/quicknote.md";
		nix-switch = "sudo nixos-rebuild switch --flake ~/Documents/nix-config/#cwm-nixos";
		hm-switch = "home-manager switch --flake ~/Documents/nix-config/#carterm@cwm-nixos";
		rstudio-dev = "nix develop /tmp/rstudio";
	};
}
