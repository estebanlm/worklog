#! /bin/bash -e

PHARO_VM=pharo-sh
IMAGE=worklog.image
DEFAULT_EDITOR=vi
open_editor=0

print_usage() {
	echo "Usage:" 
	echo "    `basename $0` <text to log>"
	echo "    `basename $0` -o"
	echo "    `basename $0` -h"
	echo ""
	echo "	-o 	Opens the editor window."
	echo "	-h 	Print this help."
	echo ""
}

while getopts "eh" option; do 
	case "$option" in
		e) open_editor=1 ;;
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

# test if we should open an editor
if [ $open_editor == 1 ]; then
	options="--open-editor"
fi

# by default, we just send the entered text to edit
if [ -z $options]; then
	options="--add --text=\"$*\""
fi

$PHARO_VM $IMAGE worklog $options
