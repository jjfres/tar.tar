#!/bin/bash

sysin=$a
dirname=$b
wtarchive=$c
archpath=$d
archname=$e
expath=$f
svout=$g
svpath=$h
dir="/home/sysadmin/"
dir+=$dirname

if [ ! -d == $dir ]; then
  mkdir /home/sysadmin && echo "$dir created."
fi
echo -e "\n"
echo -e "Note - these will always save to [/home/sysadmin] if you do not have this directory this script will create it for you.\nAll archives will be saved to [/home/sysadmin/] just in different folders or the same folders, your choice.. \n "
echo -e "What system function would you like to perform?\n\nFull System Backup - [f]\n\nTargeted System Backup - [t]\n\nList System Archive - [l]\n\nExtract System Archive - [x]"

read -n 1 sysin
 
#Full System Backup - 
if [ $sysin == "f" ]; then
  echo "Name of storage directory or name of new creation of storage directory: - ex. [sys_backup] '\n'" && read dirname 
  sleep 1
fi
if [ -d == $dir ] && [ $sysin == "f" ]; then
  tar cvWf full_backup.tar -C /home/sysadmin/$dirname /home/ 
elif [ ! -d == $dir ] && [ $sysin == "f" ]; then
  echo "Creating directory $dirname and archiving /home/.."
  echo -ne '#############                      \r'
  sleep 1
  echo -ne '##########################              \r'
  sleep 1
  echo -ne '#######################################    \r'
  echo -ne '\n'
  mkdir /home/sysadmin/$dirname && tar cvWf full_backup.tar -C /home/sysadmin/$dirname /home/  
elif [ $sysin != "f" ] && [ $sysin != "t" ] && [ $sysin != "l" ] && [ $sysin != "x" ]; then
  echo "error: Please enter one of the following flags - 'f,t,l,x'."
  echo "now exiting, please run again."
  exit
else
  echo -ne " "
fi

#Targeted System Backup
if [ $sysin == "t" ]; then
  echo "Name of storage directory or creation of storage directory: - ex. [sys_backup] - " && read dirname 
  sleep 1
fi
if [ -d == $dir ] && [ $sysin == "t" ]; then
  read -p "Enter Desired Name of Archive - ex. [archive_two.tar] - " archname
  read -p "Path you want to archive: ex. [/home/sysadmin/] - " wtarchive
  tar cvWf $archname -C /home/sysadmin/$dirname $wtarchive 
  sleep 1
  echo "Archiving $wtarchive into $dirname.."
elif [ ! -d == $dir ] && [ $sysin == "t" ]; then
  read -p "Enter Desired Name of Archive - ex. [archive_two.tar] - " archname
  read -p "Path you want to archive: ex. [/home/sysadmin/] - " wtarchive
  echo -ne '#############                      \r'
  sleep 1
  echo -ne '##########################              \r'
  sleep 1
  echo -ne '#######################################    \r'
  echo -ne '\n'
  mkdir /home/sysadmin/$dirname && tar cvWf $archname -C /home/sysadmin/$dirname $wtarchive  
elif [ $sysin != "f" ] && [ $sysin != "t" ] && [ $sysin != "l" ] && [ $sysin != "x" ]; then
  echo "error: Please enter one of the following flags - 'f,t,l,x'."
  echo "now exiting, please run again."
  exit
else
  echo -ne " "
fi

#Listing of Archives - 

if [ $sysin == "l" ]; then
  echo "Please enter path to archive you would like to list - ex. [/home/sysadmin/new_backup.tar]? " && read archpath 
  sleep 1
  tar -tvf $archpath
  echo "-------------------------------------------------------------------------------------"
  echo "Your archive has been listed. Would you like to save this output to a file [y/n]: " && read svout
  echo -ne '\n'
if [ $svout == "y" ]; then
  read -p "Please enter path and name of file - ex. [/home/sysadmin/docs.txt]" svpath
  tar -tvf $archpath >> $svpath
  echo "-------------------------------------------------------------------------------------"
  echo "Your archive has been listed and filed."
elif [ $svout == "N" ]; then
  exit
elif [ $sysin != "f" ] && [ $sysin != "t" ] && [ $sysin != "l" ] && [ $sysin != "x" ]; then
  echo "error: Please enter one of the following flags - 'f,t,l,x'."
  echo "now exiting, please run again."
  exit
else
  echo -ne " "
  fi
fi

#Extracting Archives

if [ $sysin == "x" ]; then
  read -p "Please enter path of archive you would like to extract - ex. [/home/sysadmin/full_backup.tar]" expath
  tar xvf $expath
  echo "-------------------------------------------------------------------------------------"
  echo "Your archive has been restored."
elif [ $sysin != "f" ] && [ $sysin != "t" ] && [ $sysin != "l" ] && [ $sysin != "x" ]; then
  echo "error: Please enter one of the following flags - 'f,t,l,x'."
  echo "now exiting, please run again."
else  
  exit
fi
