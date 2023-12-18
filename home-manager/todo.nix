{
	imports = [
	];

	xdg.configFile.todo = {
		target = "todo/config";
		text = ''
			# Your todo.txt directory (this should be an absolute path)
			#export TODO_DIR="/Users/gina/Documents/todo"
			export TODO_DIR="/home/carterm/Documents/my_notes/todo"
						# Your todo/done/report.txt locations
			export TODO_FILE="$TODO_DIR/todo.txt"
			export DONE_FILE="$TODO_DIR/done.txt"
			export REPORT_FILE="$TODO_DIR/report.txt"
						# You can customize your actions directory location
			#export TODO_ACTIONS_DIR="$HOME/.todo.actions.d"
						# Default action
			export TODOTXT_DEFAULT_ACTION=ls
						# == EDIT FILE LOCATIONS ABOVE ===
						# === COLOR MAP ===
						## Text coloring and formatting is done by inserting ANSI escape codes.
			## If you have re-mapped your color codes, or use the todo.txt
			## output in another output system (like Conky), you may need to
			## over-ride by uncommenting and editing these defaults.
			## If you change any of these here, you also need to uncomment
			## the defaults in the COLORS section below. Otherwise, todo.txt
			## will still use the defaults!
						# export BLACK='\\033[0;30m'
			# export RED='\\033[0;31m'
			# export GREEN='\\033[0;32m'
			# export BROWN='\\033[0;33m'
			# export BLUE='\\033[0;34m'
			# export PURPLE='\\033[0;35m'
			# export CYAN='\\033[0;36m'
			# export LIGHT_GREY='\\033[0;37m'
			# export DARK_GREY='\\033[1;30m'
			# export LIGHT_RED='\\033[1;31m'
			# export LIGHT_GREEN='\\033[1;32m'
			# export YELLOW='\\033[1;33m'
			# export LIGHT_BLUE='\\033[1;34m'
			# export LIGHT_PURPLE='\\033[1;35m'
			# export LIGHT_CYAN='\\033[1;36m'
			# export WHITE='\\033[1;37m'
			# export DEFAULT='\\033[0m'
						# === COLORS ===
						## Uncomment and edit to override these defaults.
			## Reference the constants from the color map above,
			## or use $NONE to disable highlighting.
			#
			# Priorities can be any upper-case letter.
			# A,B,C are highlighted; you can add coloring for more.
			#
			# export PRI_A=$YELLOW        # color for A priority
			# export PRI_B=$GREEN         # color for B priority
			# export PRI_C=$LIGHT_BLUE    # color for C priority
			# export PRI_D=$...            # define your own
			# export PRI_X=$WHITE         # color unless explicitly defined
						# There is highlighting for tasks that have been done,
			# but haven't been archived yet.
			#
			# export COLOR_DONE=$LIGHT_GREY
						# There is highlighting for projects, contexts, dates, and item numbers.
			#
			# export COLOR_PROJECT=$RED
			# export COLOR_CONTEXT=$RED
			# export COLOR_DATE=$BLUE
			# export COLOR_NUMBER=$LIGHT_GREY
						# There is highlighting for metadata key:value pairs e.g.
			# DUE:2006-08-01 or note:MYNOTE
			#
			# export COLOR_META=$CYAN
						# === BEHAVIOR ===
						## customize list output
			#
			# TODOTXT_SORT_COMMAND will filter after line numbers are
			# inserted, but before colorization, and before hiding of
			# priority, context, and project.
			#
			# export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort --ignore-case --field-separator=":" -k2,2 --stable'
						# TODOTXT_FINAL_FILTER will filter list output after colorization,
			# priority hiding, context hiding, and project hiding. That is,
			# just before the list output is displayed.
			#
			export TODOTXT_FINAL_FILTER='sort --ignore-case --field-separator=":" -k2,2 --stable'
			'';
	};
}
