#!/bin/bash
#issued on : 5 Mei 2018
#coded By Achon666ju5t
NC='\033[0m'
GREEN='\e[38;5;82m'
CYAN='\e[38;5;45m'
RED='\e[38;5;196m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'
header(){
printf "${GREEN}"
printf "     ___        __                _____ _____ _____   _       ________    \n"
printf "    /   | _____/ /_  ____  ____  / ___// ___// ___/  (_)_  __/ ____/ /_   \n"
printf "   / /| |/ ___/ __ \/ __ \/ __ \/ __ \/ __ \/ __ \  / / / / /___ \/ __/   \n"
printf "  / ___ / /__/ / / / /_/ / / / / /_/ / /_/ / /_/ / / / /_/ /___/ / /_     \n"
printf " /_/  |_\___/_/ /_/\____/_/ /_/\____/\____/\____/_/ /\__,_/_____/\__/     \n"
printf "=========Finding-Nemo==========================/___/======================\n"
}
clear
header
if [ ! -d Ec ]; then
	mkdir Ec
fi
echo -n "Your Dork : "
read dork
ea=$(lynx --dump "https://google.com/search?q=$dork" | grep -Po "(?<=url\?q=).*?(?=\&)")
lynx --dump "https://google.com/search?q=$dork" | grep "search?q=" | tail | gawk -F/ '{ print $4 }' >> Ec/page.txt
printf "${RED}[+]${GREEN}$ea${NC}\n"
echo "$ea" >> Ec/result.txt
for ngambil in $(cat Ec/page.txt); do
	 	exc=$(lynx --dump "https://google.com/$ngambil" | grep -Po "(?<=url\?q=).*?(?=\&)")
	 	printf "\n${RED}[+]${GREEN}$exc${NC}\n"
	 	echo "$exc" >> Ec/result.txt
	 done
	 printf "\n${RED}[+]${GREEN}Dorking Form Google.com ${RED}[Done]${NC}\n"
	 sleep 10
	 printf "${RED}[!]Starting Reverse and find more site similiar [!]${NC}\n"
	 sleep 3
for reverse in $(cat Ec/result.txt | gawk -F/ '{ print $3 }'); do
	printf "${RED}[+] Reversing $i ${NC}\n\n"
	rev=$(lynx -dump "http://viewdns.info/reverseip/?host=$reverse&t=1" | grep -v "viewdns" | awk '{ print $1 }')
	echo "$rev" >> Ec/reverse.txt
	exx=$(lynx -dump "https://www.alexa.com/siteinfo/$reverse" | grep siteinfo | grep -v "$reverse" | tail -7 | gawk -F/ '{ print $5 }')
	exxx=$(lynx -dump "https://www.similarsites.com/site/$reverse" | grep "/site/" | gawk '{ print $2 }' | gawk -F/ '{ print $5 }')
	echo "$exx"
	echo "$exxx"
	echo "$exx" >> Ec/reverse.txt
	echo "$exxx" >> Ec/reverse.txt
done
printf "${RED}[+]Reversing Site ${GREEN}[ DONE ]${NC}\n"
sleep 2
for i in $(cat Ec/reverse.txt); do
	printf "${RED}[+] Checking $i [+]\n${NC}"
	ecac=$(curl -sNI $i -m 10)
	if [[ "$ecac" =~ "200" ]]; then
		printf "${GREEN}[+] $i [+] Status : 200 OK [+]\n${NC}"
		echo "------------------------------------------"
		echo "$i" >> Ec/total.txt
	elif [[ "$ecac" =~ "301" ]]; then
		printf "${GREEN}[+] $i [+] Status : 301 Redirect [+]\n${NC}"
		echo "------------------------------------------"
	else
		echo "[+] $i Udah mokad atau Forbidden"
		echo "$i" >>Ec/totalgaok.txt
	fi
done
echo "all done silakan di testing site nya :)"
sleep 3
rm -f Ec/page.txt
rm -f Ec/result.txt
echo "Wanna Get Premium ?"
echo "contact me : https://www.facebook.com/aksiteruzzzzzz"
echo "this free tools only dorking to google then reverse them"
echo "wanna find something more spesific ? like shop/ticket/or everything ?"
echo "only \$20 via BTC or Rp.250.000 :)))"
