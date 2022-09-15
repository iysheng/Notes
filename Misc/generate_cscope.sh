#!/bin/sh

# A file to generate cscope.files by .o files


SRC=/tmp/obj.txt

if [ $# -eq 1 ];then
	SRC=$1
fi

if [ ! -f $SRC ];then
	echo "No found such $SRC file"
fi

TARGET_DATA_FILE=cscope.files

if [ -f $TARGET_DATA_FILE ];then
mv $TARGET_DATA_FILE $TARGET_DATA_FILE.back
fi

touch $TARGET_DATA_FILE

RAW_SRC=`cat $SRC`
c_file_counts=0
S_file_counts=0

for raw_obj in $RAW_SRC;do
	#echo $raw_obj
	raw_base_obj=${raw_obj%.o}
	raw_base_obj_c=$raw_base_obj\\.c
	raw_base_obj_S=$raw_base_obj\\.S
	c_target_ans=`fd --full-path $raw_base_obj_c | head -n 1`
	echo $c_target_ans
	if [ $c_target_ans ];then
		echo $c_target_ans >> $TARGET_DATA_FILE
		c_file_counts=$((c_file_counts+1))
	else
    	S_target_ans=`fd --full-path $raw_base_obj_S | head -n 1`
		echo $S_target_ans
		if [ $S_target_ans ];then
		echo $S_target_ans >> $TARGET_DATA_FILE
		S_file_counts=$((S_file_counts+1))
		fi
	fi
    echo "c_file_counts:$c_file_counts ""S_file_counts:$S_file_counts"
done

