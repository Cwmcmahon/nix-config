{ pkgs }:
	pkgs.writeShellScriptBin "push_notes" ''
		cd ~/Documents/workbench/
		git pull
		git add -A
		git commit -am "$(date)"
		git push
	''
