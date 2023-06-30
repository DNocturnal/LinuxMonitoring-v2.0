#!/bin/bash

name_dir=$1
name_file=$2
size=$3
check_size=1048576
file_path=$(pwd)/../01/main.sh
script_dir=$(pwd)/
start_time=$(date +"%H:%M:%S")
cd /
random() {
     echo $(($1 + $RANDOM % $2))
}

check_parametr() {
    if [[ ! "$name_dir" =~ ^[a-z]{1,7}$ ]]; then
        echo  "\033[35mПервый параметр должен содержать не более 7 латинских символов!"
        exit 1
    fi
    if [[ ! "$name_file" =~ ^[a-z]{1,7}\.[a-z]{1,3}$ ]]; then
        echo -e "\033[35mВторой параметр должен содержать имя файла и расширение, не более 7 и 3 латинских символов соответственно!"
        exit 1
    fi
    if [[ ! "$size" =~ ^([1-9]|[1-9][0-9]|100)(Mb|mb)$ ]]; then
        echo -e "\033[35mТретий параметр должен быть числом от 1 до 100(В мегабайтах)!"
        exit 1
    fi
}

system() {

    while true
    do
        system_size=$(df -k | grep "/$" | awk '{print $4}')
        if (( $system_size < $check_size ))
        then
            echo -e "\033[35mНет места на диске!"
            break
        fi
        dirs_count=$( ls -d */ | cut -f1 -d'/' | grep -vE "^.+_($file_date)$" |  wc -l  )
        if (( $dirs_count ))
        then
            random_dir=$(random 1 $dirs_count)
            dir_name=$(ls -d */ | cut -f1 -d'/' | grep -vE "^.+_($file_date)$" | awk -v var="${random_dir}" 'BEGIN{ RS = "" ; FS = "\n" } {print $var}')
            dirpath=$(pwd)/$dir_name
            dirs_c=$((2 + $RANDOM % 10))
            files_c=$((2 + $RANDOM % 20))

            $file_path "$dirpath" "$dirs_c" "$name_dir" "$files_c" "$name_file" "$size"
            cd $dir_name
        else
            cd /
        fi

    done
}



check_parametr
system

end_time=$(date +"%H:%M:%S")

echo "Start time: "$start_time" " >> logscript.log
echo "End time: "$end_time" " >> logscript.log
# echo "Script execution time (in seconds) = "$end_time - $start_time" " >> log.log
mv /logscript.log $script_dir

exit 0