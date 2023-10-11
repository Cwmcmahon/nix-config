{ pkgs }:
	pkgs.writeShellScriptBin "daily_todo" ''
		${pkgs.nb}/bin/nb todo add --due $(date +%F) --description "Daily todo for $(date +%F)" --task "Take meds" --task "Shower" --task "Do laundry" --task "Make bed" --task "Setup scene" --task "Do dishes" --task "Job search"
	''
