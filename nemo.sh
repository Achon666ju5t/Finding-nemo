#Coded By Demeter_16
#Thanks to x'1n73ct - Versailles
cyan='\033[0;36m'
kuning='\033[1;33m'
putih='\033[0m'
ijo='\e[38;5;82m'
merah='\e[38;5;196m'
printf "${kuning}"
header(){
printf "${kuning}	[#][#][#][#][#][#][#][#][#][#][#][#][#][#][#][#][#]\n"
printf "%-48s ${kuning}[#]\n""	[#]$(printf ${ijo})      ___                __         _______"  "	[#]"
printf "%-1s ${kuning}[#]\n""	[#]$(printf ${ijo})     / _ \___ __ _  ___ / /____ ___<  / __/"
printf "%-1s ${kuning}[#]\n""	[#]$(printf ${ijo})    / // / -_)  ' \/ -_) __/ -_) __/ / _ \ "
printf "%-1s ${kuning}[#]\n""	[#]$(printf ${ijo})   /____/\__/_/_/_/\__/\__/\__/_/ /_/\___/ "
printf "${cyan}%-1s [#]\n"
printf "%-49s ${cyan}[#]\n" "	[#] $(printf ${merah})		Coded By Demeter_16"
printf "%-49s ${cyan}[#]\n" "	[#] $(printf ${merah})		    Log Scanner"
printf "%-56s ${cyan}[#]\n" "	[#] $(printf ${merah})	https://github.com/Achon666ju5t"
printf "%-56s ${cyan}[#]\n" "	[#] $(printf ${merah})	https://pastebin.com/u/achonxhax0r"
printf "	[#][#][#][#][#][#][#][#][#][#][#][#][#][#][#][#][#]\n"
}
header
printf "${putih}\n"
list="base64_decode base64_encode base32_decode base32_encode eval src mail (isset(\\\$_GET\[' pasthru system exec shell_exec copy\(\) move_uploaded_file"
ngegas(){
printf "${cyan}Default List :\n$(echo $list)\n"
read -p "Add More List ? [y/n] " more
if [[ $more = "y" ]]; then
	while true; do
		read -p "Your File List : " file
		if [[ ! -f $file ]]; then
			printf "No File Name $file, do you type correctly? here the file on this directory\n$(ls)\n"
			continue;
		else
			printf "You Have $(cat $file | wc -l ) Wordlist To scan\n"
			y=$(cat $file)
			IFS=$'\r\n' GLOBIGNORE='*' command eval  'sp=($y)'
			for (( i = 0; i < "${#sp[@]}"; i++ )); do
				listfile="${sp[$i]}"
				ex=$(grep -rli "$listfile")
				printf "Word To Scan : $listfile\n"
				printf "File Name :\n$ex\n"
				printf "Result For Word To Scan : $ex\n"
				printf "$(grep -rli "$listfile" | wc -l) File Have $listfile\n"
				echo "==========================="
				sleep 5
			done
			break;
		fi
	done
else
for lix in $list; do
	oktav=$(grep -rli "$lix")
	printf "Word To Scan : $lix\n"
	printf "File Name :\n$oktav\n"
	printf "Result For Word To Scan : $lix\n"
	printf "$(grep -rli "$lix" | wc -l ) File Have $lix\n"
	echo "==========================="
	sleep 5
	#echo ${lix}
done
fi
}
printf "${ijo}Save The Result? [y/n] "
read res
if [[ "$res" = "y" ]]; then
	read -p "Result Saved To : " savedto
	okkkk=$(ngegas)
	echo "$okkkk"
	echo "$okkkk" >> $savedto
else
ngegas
fi
header
printf "${kuning}Thanks for using this tools :) ${merah}have a good day!\n"
