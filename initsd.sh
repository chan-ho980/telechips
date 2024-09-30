#!/usr/bin/env bash
SDCARD_PATH=/media/usr/bootfs
CONFIG_TXT=config.txt
CMDLINE_TXT=cmdline.txt

# sd을 인식한다
function detectSD(){
	while true;do
		if [ -d "${SDCARD_PATH}" ]; then
			echo "Find SD card!"
			return
		fi
		sleep 1
	done
}


# find config.txt cmdline.txt
detectSD
function detectCMDLINE(){
	sleep 1
	if [ -f "${SDCARD_PATH}/${CMDLINE_TXT}" ]; then
		#echo -n "Find cmdline.txt!"
		echo 0
		return
	else
		echo 1
	fi
}

#2 find cmdline.txt 
isCMDLINE='detectCMDLINE'
IPADDR=192.168.111.1
if [ $isCMDLINE -eq 0 ];then
	# find c & modify
	# sed "s/${IPADDR}/111.111.111.111/" "${SDCARD_PATH}/${CMDLINE_TXT}"
	if [ $? -eq 0 ];then
		echo "Correct ${CMDLINE_TXT} !"
	else
		echo "Remain ${CMDLINE_TXT} !"
	fi
fi
# umount /media/usr/bootfs


