# Fundwave DevOps Task


## Problem Statement

Hooli Inc. is on a sprint spree and their development team is continuously rolling out
new features and fixing bugs. The DevOps team now needs to ensure that the app
updates are installed correctly for every user.
Write a bash script that takes in the user’s current version preferably as a parameter,
fetches all the versions which have database updates serially from a separate text file,
and lists out the versions which need to be updated.
Version format: major.minor.patch (eg- 2.5.23)


Part 1
Write a bash script where the current version and the latest version do not have a major
update. Only minor versions or patch may vary.
Eq- current version is 2.5.23, and latest version is 2.6.0


Part 2
In the same bash script file as for part 1 of the question, include changes so that it
identifies changes in major version if any.
Eq- current version is 2.5.23, and latest version is 3.1.2


## Solution 
```bash
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

```
