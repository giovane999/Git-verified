#! /bin/bash

# Seta as cores 
RED='\033[0;31m' # Red
NC='\033[0m' # No Color
VERDE='\033[0;32m' # Green 
LAZUL='\e[96m' # Ligth Blue 
BOLD='\e[1m' # Bold 
# Seta as cores 


for dominio in $(cat lista-url-git.txt);do # Get list domains  
	for gits in $(cat listaGit);do # Get list of files git 

		httpResposta=$(curl -I $dominio$gits 2>/dev/null | head -n 1 | cut -d$' ' -f2) # Get response HTTP code 
		if [ $httpResposta == "200" ] # If HTTP code = 200, Url Vulnerable
			then	
				printf "${LAZUL}${BOLD}[+] Domínio Vulnerável${NC} $dominio$gits${NC}"; 
				echo
			else # Else Not Vulnerable
				printf "${RED}${BOLD}[+] Domínio Não Vulnerável${NC} $dominio$gits${NC}"; 
				echo
		fi # End if 
	done # End first For 
done # End second For 
