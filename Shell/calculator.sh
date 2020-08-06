#!/bin/bash
#Command line calculator Ver0.1

read -t 30 -p "Please enter the first operand: " num1
read -t 30 -p "Please enter the operator: " op
read -t 30 -p "Please enter the second operand: " num2

if [ -n "$num1" -a -n "$num2" -a -n "$op" ]
	then
	ifInt1=$(echo $num1 | sed ' s/[0-9]//g')
	ifInt2=$(echo $num2 | sed ' s/[0-9]//g')
	
	if [ "$ifInt1" == "" -a -z "$ifInt2" ]
		then
		if [ "$op" == "+" ]
			then 
			result=$(($num1 + $num2))
		elif [ "$op" == "-" ]
			then
			result=$(($num1 - $num2))
		elif [ "$op" == "*" ]
			then
			result=$(($num1 * $num2))
		elif [ "$op" == "/" ]
			then
			result=$(($num1 / $num2))
		else
			echo "Please enter a valid operator"
			exit 11
		fi
	else
		echo "Please enter valid operands"
		exit 11
	fi
else
	echo "Please assign all 3 variables properly"
	exit 11
fi

echo "$num1 $op $num2 = $result"
