{ pkgs }:
	pkgs.writeShellScriptBin "daily_todo" ''
		todo.sh replace 1 "(A) Take meds @home +daily due:$(date +%F)"
		todo.sh replace 2 "(A) Brush teeth AM @home +daily due:$(date +%F)"
		todo.sh replace 3 "(B) Make bed @home +daily due:$(date +%F)"
		todo.sh replace 4 "(B) Set up scene @home +daily due:$(date +%F)"
		todo.sh replace 5 "(B) Do dishes @home +daily due:$(date +%F)"
		todo.sh replace 6 "(A) Brush teeth PM @home +daily due:$(date +%F)"
	''
