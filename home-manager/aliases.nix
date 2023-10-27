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
    commit-notes = ''pushd ~/Documents/workbench/ && git add -A && git commit -am "$(date)" && popd'';
		push-notes = ''pushd ~/Documents/workbench/ && git push && popd'';
		pull-notes = "pushd && ~/Documents/workbench/ && git pull && popd";
		nix-switch = "sudo nixos-rebuild switch --flake ~/Documents/nix-config/#cwm-nixos";
		hm-switch = "home-manager switch --flake ~/Documents/nix-config/#carterm@cwm-nixos";
	};
}
