#!/bin/bash

path=$1
c_dir=$2
name_dir=$3
c_file=$4
name_file=$5
size=$6

check_directory() {
    if [ -d "$path" ]; then
       check_parametr
    else
        echo -e "\033[35mДиректории '$path' не существует! Введите параметры вида: main.sh . 4 az 5 az.az 3kb"
        exit 1
    fi
    if [ ! -w "$path" ]; then
        echo -e "\033[35mНет прав для записи в директорию!"
        exit 1
    fi
}

check_parametr() {
  # if [[ $# -ne 6 ]]; then 
  #   echo -e "\033[35mВведите 6 параметров!"
  # fi
  if [[ ! "$c_dir" =~ ^[1-9]|[1][0]+$ ]]; then
    echo -e "\033[35mВторой параметр должен быть числом!"
    exit 1
  fi
  if [[ ! "$name_dir" =~ ^[a-z]{1,7}$ ]]; then
    echo  "\033[35mТретий параметр должен содержать не более 7 латинских символов!"
    exit 1
  fi
  if [[ ! "$c_file" =~ ^[1-9]|[1][0]+$ ]]; then
    echo -e "\033[35mЧетвертый параметр должен быть числом от 1 до 100!"
    exit 1
  fi
  if [[ ! "$name_file" =~ ^[a-z]{1,7}\.[a-z]{1,3}$ ]]; then
    echo -e "\033[35mПятый параметр должен содержать имя файла и расширение, не более 7 и 3 латинских символов соответственно!"
    exit 1
  fi
  if [[ ! "$size" =~ ^([1-9]|[1-9][0-9]|100)(Kb|kb| Mb|mb)$ ]]; then
    echo -e "\033[35mШестой параметр должен быть числом от 1 до 100!"
    exit 1
  fi
}

system() {
  datefile=$(date +"%d%m%y")
  lastchar=${name_dir:${#name_dir}-1:1}
  size_1=${#name_dir}
  name=$(awk -F'.' '{print $1}' <<< "$name_file")
  firstchar=${name:0:1}
  size_2=${#name}
  for (( ; size_1 < 4; size_1++ ))
  do
      name_dir="$firstchar$name_dir"
  done

  for (( ; size_2 < 4; size_2++ ))
  do
      name="$firstchar$name_file"
  done
  ext=$(awk -F'.' '{print $2}' <<< "$name_file")
  file_name="${name}_${datefile}.${ext}"

  log_dir="$(pwd)/logscript.log"

  for (( a = 0; a < $c_dir; a++ ))
  do
      dirs_path="${path}/${name_dir}_${datefile}"
      mkdir -p $dirs_path
      echo "$path/${name_dir}_${datefile}/    $(date)" >> $log_dir
      cd $dirs_path
          fname=$file_name
          for (( i = 0; i < $c_file; i++ ))
          do
              system_size=$(df -k | grep "/$" | awk '{print $4}')
              free_space=$((system_size - size_kb))
              if (( $free_space < 1048576 ))
              then
                  echo "\033[35mНа диске осталось меньше 1 Гб свободного места!"
                  exit 0
              fi
              fallocate -l $size $fname  2>/dev/null
              echo "$path/${name_dir}_${datefile}/$fname $(date)  $size" >> $log_dir
              firstchar=${file_name:0:1}
              fname="$firstchar$fname"
          done
      cd ..
      name_dir="$name_dir$lastchar"
    
  done
  

}

check_directory
system
echo -e "\033[35mСкрипт завершен!" >> $log_dir
exit 0

