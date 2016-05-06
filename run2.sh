#!/bin/sh
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --title "Ввод данных" --clear \
        --inputbox "Привет! Перед вами пример ввода даных\nВведите своё имя:" 16 51 2> $tempfile

retval=$?

    	clear
case $retval in
  0)
    echo "Вы ввели `cat $tempfile`"
    ;;
  1)
    echo "Отказ от ввода.";;
  255)
    if test -s $tempfile ; then
      cat $tempfile
    else
      echo "Нажата клавиша ESC."
    fi
    ;;
esac
