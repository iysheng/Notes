#!/bin/sh

OUTSCREEN=`xrandr | grep " connected" | cut -f 1 -d " "`

function extend_dispaly()
{
    for outscreen in $OUTSCREEN;do
        if [ $outscreen != "eDP-1" ];then
            xrandr --output $outscreen --right-of eDP-1 --auto
        fi
    done
}

__ScriptVersion="0.9"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================

function usage ()
{
    echo "Usage :  $0 [options] [--]

    Options:
    -b|brightness Set brightness
    -v|version    Display script version"

}

function set_brightness()
{
    echo "set brightness" $*
    for outscreen in $OUTSCREEN;do
        xrandr --output $outscreen --brightness $1
    done
}


function do_with_display()
{
    while getopts "b:v" opt
    do
      case $opt in
    
    	b|brightness )  set_brightness $OPTARG; exit 0   ;;
    
    	v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;
    
    	* )  echo -e "\n  Option does not exist : $OPTARG\n"
    		  usage; exit 1   ;;
    
      esac    # --- end of case ---
    done
    shift $(($OPTIND-1))
}

if [ $# -gt 0 ];then
    do_with_display $*
else
    extend_dispaly
fi


