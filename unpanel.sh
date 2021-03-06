#!/bin/bash

set -e

########################################################
# 
#          Uninstall Panel
#
#         
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
echo "* Thank you for using this script"
print_brake 70
echo


sudo rm -rf /var/www/pterodactyl
sudo rm /etc/systemd/system/pteroq.service
sudo unlink /etc/nginx/sites-enabled/pterodactyl.conf

mysql -u root

DROP DATABASE panel;
DROP USER 'pterodactyl'@'127.0.0.1';

done
