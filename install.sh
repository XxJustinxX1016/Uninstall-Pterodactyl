#!/bin/bash

set -e

########################################################
# 
#         Pterodactyl-Uninstall 
#
#         Created and maintained by XxJustinxX1016
#
#            Thank You
#
########################################################


SCRIPT_VERSION="v1.0"


print_brake() {
  for ((n = 0; n < $1; n++)); do
    echo -n "#"
  done
  echo ""
}

hyperlink() {
  echo -e "\e]8;;${1}\a${1}\e]8;;\a"
}

#### Colors ####

reset="\e[0m"
red='\033[0;31m'

error() {
  red='\033[0;31m'
  reset="\e[0m"

  echo ""
  echo -e "* ${red}ERROR${reset}: $1"
  echo ""
}


#### Check Sudo ####

if [[ $EUID -ne 0 ]]; then
  echo "* This script must be executed with root privileges (sudo)." 1>&2
  exit 1
fi


#### Check Curl ####

if ! [ -x "$(command -v curl)" ]; then
  echo "* curl is required in order for this script to work."
  echo "* install using apt (Debian and derivatives) or yum/dnf (CentOS)"
  exit 1
fi

cancel() {
echo
echo -e "* ${red}Installation Canceled!${reset}"
done=true
exit 1
}

done=false

echo
print_brake 70
echo "* Uninstall-Pterodactyl @ $SCRIPT_VERSION"
echo
echo "* Copyright (C) 2022 - $(date +%Y), XxJustinxX1016."
echo "* https://github.com/XxJustinxX1016/Uninstall-Pterodactyl"
echo
echo "* This script is not associated with the official Pterodactyl Project."
print_brake 70
echo

UninstallPanel() {
bash <(curl https://raw.githubusercontent.com/XxJustinxX1016/Uninstall-Pterodactyl/main/unpanel.sh)
}

UninstallWings() {
bash <(curl -s)
}

UninstallBoth() {
bash <(curl -s)
}


while [ "$done" == false ]; do
  options=(
    "Uninstall Panel (Uninstall Your Panel)"
    "Uninstall Wings (Uninstall Your Wings)"
    "Uninstall Both (Uninstall Your Panel & Wings) Coming soon"
    
    
    "Cancel Installation"
  )
  
  actions=(
    "UninstallPanel"
    "UninstallWings"
    "UnistallBoth"
    
    "cancel"
  )
  
  echo "* Uninstall Pterodactyl?"
  echo
  
  for i in "${!options[@]}"; do
    echo "[$i] ${options[$i]}"
  done
  
  echo
  echo -n "* Input 0-$((${#actions[@]} - 1)): "
  read -r action
  
  [ -z "$action" ] && error "Input is required" && continue
  
  valid_input=("$(for ((i = 0; i <= ${#actions[@]} - 1; i += 1)); do echo "${i}"; done)")
  [[ ! " ${valid_input[*]} " =~ ${action} ]] && error "Invalid option"
  [[ " ${valid_input[*]} " =~ ${action} ]] && done=true && eval "${actions[$action]}"
done
