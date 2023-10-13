{ pkgs }:
	pkgs.writeShellScriptBin "daily_todo" ''
		${pkgs.nb}/bin/nb todo add ''${1:-$(date +%F)} --due ''${1:-$(date +%F)} --description "Daily todo for ''${1:-$(date +%F)}" --task "Take meds" --task "Shower" --task "Do laundry" --task "Make bed" --task "Setup scene" --task "Do dishes" --task "Job search" --filename ''${1:-$(date +%F)} --folder todo_notes
	''
