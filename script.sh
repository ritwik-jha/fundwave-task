#!/bin/bash


echo "current version => $1"

IFS='.' read -r -a cv_array <<< "$1"

for i in $(cat versions.txt)
do
	IFS='.' read -r -a array <<< "$i"
	if [ "${array[0]}" -gt  "${cv_array[0]}" ]
	then
		echo $i
	else
		if [ "${array[0]}" -eq "${cv_array[0]}" ]
		then
			if [ "${array[1]}" -gt "${cv_array[1]}" ]
			then
				echo $i
			else
				if [ "${array[1]}" -eq "${cv_array[1]}" ]
				then
					if [ "${array[2]}" -gt ${cv_array[2]} ]
					then
						echo $i
					fi
				fi
			fi
		fi
	fi
done
