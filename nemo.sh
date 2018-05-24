#!/usr/bin/bash
#/bin/bash
##########################################################################################
# 	This Tools will Find Site Form Your Dork to google.com | actually google dorker  #
# After dorking This tools will find SIMMILIAR SITE FORM ALEXA.COM AND SIMMILIARSITE.COM #
# 	Then He will checking status like 200 | 302 | 500 | 404 | 403 | 301 	 	 #
#	 		    And i Have 2 Version For This tools		 	 	 #
# For Another Version (Premium) this tools will find Shopping Site | or ticketing Site   #
#		Thank's To : IndoXploit - Extreme Crew - Bc0de.net - ZeroByte.id 	 #
#			   Finding-Nemo - Coded By Achon666ju5t				 #
# 	Want Try Premium ? You Can only buy it with $20 Via BTC Or Rp.250.000 Via Bank   #
# 		    My Facebook : https://www.facebook.com/aksiteruzzzzzz		 #
# 				Achonxhax0r@outlook.com					 #
##########################################################################################NC='\033[0m'
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
echo -n "Your Dork : "
read dork
echo -n "Result Saved To : "
read res
if [ ! -d $res ]; then
	mkdir $res
fi
pa=$res/page.txt
bil=$res/google.txt
hr=$res/reverse.txt
ok=$res/site-200.txt
redir=$res/site-301.txt
pat=$res/site-404.txt
pati=$res/site-403.txt
mara=$res/site-500.txt
song=$res/site-301.txt
touch $pa
touch $bil
touch $hr
touch $ok
touch $redir
touch $pat
touch $pati
touch $mara
touch $song
printf "${YELLOW}[+] Start Google Dorking[+]\n${NC}"
printf "${CYAN}[+]Your Dork : $dork [+]\n"
sleep 3s
dorking=$(lynx -dump "google.com/search?q=${dork}" | grep -Po "(?<=url\?q=).*?(?=\&)")
lynx -dump "google.com/search?q=$dork" | grep "search?q=" | tail | gawk -F/ '{ print $4 }' >> $pa
printf "${CYAN}\n"
echo "$dorking"
printf "${NC}\n"
echo "$dorking" >> $bil
for more in $(cat $pa); do
	page=$(lynx -dump "google.com/$more" | grep -Po "(?<=url\?q=).*?(?=\&)")
 	printf "${CYAN}$page[+]${NC}\n"
	echo "$page" >> $bil
done
sleep 3s
printf "${RED}[+]End Google Dorking[+]${NC}\n"
sleep 6s
printf "${YELLOW}[+] Start Reversing Site Form Dorking [+]\n${NC}"
sleep 5s
for reverse in $(cat $bil | gawk -F/ '{ print $3 }' ); do
	printf "${YELLOW}[+]Reversing http://$reverse [+]${NC}"
	sleep 5s
	rev=$(curl -s "http://viewdns.info/reverseip/?host=$reverse&t=1" | grep -Po "(?<=\<td>).*?(?=\<\/td>)" | tail -n +4)
	printf "\n${CYAN}$rev${NC}\n"
	echo "$rev" >> $hr
	alexa=$(lynx -dump "https://www.alexa.com/siteinfo/$reverse" | grep siteinfo | grep -v "$reverse" | tail -7 | gawk -F/ '{ print $5 }')
	printf "${CYAN}$alexa\n${NC}"
	echo "$alexa" >> $hr
	sim=$(lynx -dump "https://www.similarsites.com/site/$reverse" | grep "/site/" | gawk '{ print $2 }' | gawk -F/ '{ print $5 }')
	printf "${CYAN}$sim${NC}\n"
	echo "$sim" >> $hr
done
sleep 3s 
printf "${YELLOW}[+]Done Reversing $(cat $hr | wc -l) Site [+]${NC}\n"
printf "${RED}[+]${NC}${CYAN}You Have $(cat $hr | wc -l) Form reversing${NC}${RED}\n${NC}"
printf "${YELLOW}[+]Start Checking Site! [+]\n${NC}"
for check in $(cat $hr); do
	printf "${RED}[+]Checking $check [+]${NC}\n"
	status=$(curl -sNI $check -m 10 | head -1)
	if [[ "$status" =~ "200" ]]; then
		printf "${RED}[+]${GREEN}$check 200 OK ${RED}[+]${NC}\n"
		echo "-----------------------------------"
		echo "$check" >> $ok
	elif [[ "$status" =~ "301" ]]; then
		printf "${RED}[+]${GREEN}$check 301 Redirect${RED} [+]${NC}\n"
		echo "-----------------------------------"
		echo "$check" >> $redir
	elif [[ "$status" =~ "404" ]]; then
		printf "${RED}[+]${GREEN}$check 404 Notfound${RED} [+]${NC}\n"
		echo "-----------------------------------"
		echo "$status" >> $pat
	elif [[ "$status" =~ "403" ]]; then
		printf "${RED}[+]${GREEN}$check 403 Forbbiden${RED} [+]${NC}\n"
		echo "-----------------------------------"
		echo "$status" >> $pati
	elif [[ "$status" =~ "500" ]]; then
		printf "${RED}[+]${GREEN}$check 500 Internal Server Error ${RED}[+]${NC}\n"
		echo "-----------------------------------"
		echo "$status" >> $mara

	elif [[ "$status" =~ "302" ]]; then
		printf "${RED}[+]${GREEN}$check 302 Redirect / Found ${RED}[+]${NC}\n"
		echo "-----------------------------------"
		echo "$status" >> $mara
	else
		printf "${RED}[+]${GREEN}$check DIE! This Site Will Not Saved"
		echo "-----------------------------------"
	fi
done
sleep 3s
printf "${GREEN}[+] Wanna Try Premium ? please Contact me : https://www.facebook.com/aksiteruzzzzzz ${NC}\n"
printf "${CYAN}Thank You For Using My Tools${NC}\n"
printf "${YELLOW}Finding-${RED}Nemo${GREEN} V.1${NC}\n"
printf "${GREEN}Report Any Bug To : achonxhax0r@outlook.com\n${RED}Have A Nice Day!${NC}\n"
