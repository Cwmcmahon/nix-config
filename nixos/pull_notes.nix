{ pkgs }:
	pkgs.writeShellScriptBin "pull_notes" ''
		cd ~/Documents/workbench/
		git pull
	''
