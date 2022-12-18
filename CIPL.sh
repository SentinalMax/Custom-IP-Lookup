#!/bin/bash
while true ;
do
	echo -e '\033[1;36mSpecify an IP Address: \033[0m' 
	read ip_address

	while true ;
	do

	echo -e '\033[1;36mSpecify a parameter (hostname, city, region, country, loc, org, postal, timezone, ALL): \033[0m'
	read param

		if [ $param == "country" ] || [ $param == "city" ] || [ $param == "hostname" ] || [ $param == "region" ] || [ $param == "loc" ] || [ $param == "org" ] || [ $param == "postal" ] || [ $param == "timezone" ]; 
		then

			text=$(curl -s http://ipinfo.io/$ip_address | grep -i "$param" | awk -F':' '{print $2}')
			echo -e '\033[1;33m'$text'\033[0m'
		elif [ $param == "all" ] || [ $param == "ALL" ]; then

			text=$(curl -s http://ipinfo.io/$ip_address)
			echo -e '\033[1;33m'$text'\033[0m'
		else
			echo -e '\033[1;31mInvalid parameter.\033[0m'
		fi
	done
done