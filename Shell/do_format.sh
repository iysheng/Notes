#!/bin/sh

ASTYLE_STYLE="kr"
ASTYLE_SRCFILE=""

do_astyle()
{
	if [ $# -lt 1 ];then
		echo "no found source file!!!"
		return -1
	fi
	# RT-thread format https://gitee.com/rtthread/rt-thread/blob/gitee_master/documentation/coding_style_cn.md
    astyle --style=$ASTYLE_STYLE --indent=spaces=4 --indent-preproc-block --pad-oper --pad-header --unpad-paren --suffix=none --align-pointer=name --lineend=linux --convert-tabs --verbose $@
}

do_help()
{
	echo "do_format [-t style: default is k&r format] srcfiles"
}

if [ $# -lt 1 ];then
	do_help
fi

while getopts "t:s:" opt;do
	case $opt in
	t)
		ASTYLE_STYLE=$OPTARG;;
	s)
		ASTYLE_SRCFILE=$OPTARG;;
	?)
		do_help;;
	esac
done
# format normal ready
shift $(($OPTIND - 1));

if [ $ASTYLE_STYLE != "" ];then
	do_astyle $ASTYLE_SRCFILE;
fi
