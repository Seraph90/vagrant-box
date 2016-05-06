#!/bin/bash

# clear the screen
tput clear


let row=`tput lines`/4
let col=`tput cols`/2-15
tput cup $row $col;
echo "Какой сервер Вы хотите выбрать?";
let row=$row+2
tput cup $row $col;
echo "1) NginX";
let row=$row+1
tput cup $row $col;
echo "2) Apache2";
let row=$row+2
tput cup $row $col;
echo "3) Выйти";

let row=$row+2
tput cup $row $col;


read -p "Выберите: " choice
case $choice in
	[1] )
		cd nginx
		vagrant up
		tput clear
		tput sgr0
		tput rc;;
	[2] )
		cd apache
		vagrant up
		tput clear
		tput sgr0
		tput rc;;
	[3] )
		tput clear
		tput sgr0
		tput rc;;
	*   ) ./run.sh;;
esac
