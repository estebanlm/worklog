#! /bin/bash -e

PHARO_VM=pharo-sh
IMAGE=../worklog.image
DEFAULT_EDITOR=vi
CMD="$PHARO_VM $IMAGE worklog"
#variables
open_system_editor=0
open_editor=0



print_usage() {
	echo "Usage:" 
	echo "    `basename $0` <text to log>"
	echo "    `basename $0` -o"
	echo "    `basename $0` -e"
	echo "    `basename $0` -h"
	echo ""
	echo "	-e 	Opens the editor defined in WL_EDITOR (default $DEFAULT_EDITOR)."
	echo "	-o 	Opens the editor window."
	echo "	-h 	Print this help."
	echo ""
}

while getopts "eoh" option; do 
	case "$option" in
		e) open_system_editor=1 ;;
		o) open_editor=1 ;;
		h) 
			print_usage
			exit 1
			;;
		\?)
      		echo "Invalid option: -$OPTARG" >&2
      		exit 1
      		;;
	esac
done

# test if we should open a system editor
if [ $open_system_editor == 1 ]; then
	if [ -z "$WL_EDITOR" ]; then
		WL_EDITOR="$DEFAULT_EDITOR"
	fi
	tmpfile=`mktemp NEWLOG.XXXXX`
	$WL_EDITOR $tmpfile
	if [ ! -s $tmpfile ]; then
		rm $tmpfile
		exit
	fi
	$CMD --add --file="`pwd`/$tmpfile"
	rm $tmpfile
	exit
fi

# test if we should open an editor
if [ $open_editor == 1 ]; then
	$CMD --open-editor
	exit
fi

# by default, we just send the entered text to edit
$CMD --add --text="$*"
