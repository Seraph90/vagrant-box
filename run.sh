#!/bin/bash

tput civis
DIALOG=${DIALOG=dialog}
tempfile=`mktemp 2>/dev/null`

${DIALOG} --clear --title "Коробка" \
  --menu "Выберите желаемый сервер:" 15 50 8 \
  "1"  "Nginx" \
  "2"  "Apache 2" \
2>$tempfile
retval=$?
choice=`cat $tempfile`
case $retval in
  0)
    case $choice in
      1) awk '{gsub("{{SERVER}}", "nginx"); print}' omni/Vagrantfile_template.tpl > omni/Vagrantfile;;
      2) awk '{gsub("{{SERVER}}", "apache2"); print}' omni/Vagrantfile_template.tpl > omni/Vagrantfile;;
    esac;;
esac

clear
tput cnorm
echo $temp
