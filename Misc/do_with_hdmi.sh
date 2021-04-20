#!/bin/sh

OUTSCREEN=`xrandr | grep " connected" | cut -f 1 -d " "`
# define avalible device
g_screen_device=("eDP-1", "HDMI-1", "", "")
g_dev_index=0

function extend_dispaly()
{
    let i=0
    for outscreen in $OUTSCREEN;do
        g_screen_device[$((i=i+1))]=$outscreen
        echo $i@${g_screen_device[$i]}
        if [ $# -gt 0 ];then
            if [ $outscreen != "eDP-1" ];then
                xrandr --output $outscreen --right-of eDP-1 --auto
            fi
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
    -n|index      Set screen device index
    -b|brightness Set brightness
    -v|version    Display script version"

}

function set_brightness()
{
    echo $g_dev_index"aaa"
    if [ $g_dev_index -ne 0 ];then
        echo ${g_screen_device[$g_dev_index]%,} "bbb"
        if [ "" != ${g_screen_device[$g_dev_index]%,} ];then
            xrandr --output ${g_screen_device[$g_dev_index]%,} --brightness $1
        else
            echo "Invalid screen device index:$g_dev_index"
        fi
    else
        for outscreen in $OUTSCREEN;do
            xrandr --output $outscreen --brightness $1
        done
    fi
}


function do_with_display()
{
    while getopts "n:b:vd" opt
    do
      case $opt in
    	n|index )  extend_dispaly; g_dev_index=$OPTARG;;
    	d|display )  extend_dispaly 1; exit 0;;
    
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
    extend_dispaly $*
fi


