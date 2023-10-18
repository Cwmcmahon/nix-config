{ pkgs }:
	pkgs.writeShellScriptBin "daily_todo" ''
		todo.sh addm "(A) Take meds @home +daily due:$(date +%F)
		(A) Brush teeth AM @home +daily due:$(date +%F)
		(B) Make bed @home +daily due:$(date +%F)
		(B) Set up scene @home +daily due:$(date +%F)
		(B) Do dishes @home +daily due:$(date +%F)
		(A) Brush teeth PM @home +daily due:$(date +%F)"
	''
