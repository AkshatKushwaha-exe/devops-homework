#!/bin/bash
# sysinfo.sh - prints system info and saves the running processes to a file

CURRENT_DATE=$(date)
HOST_NAME=$(hostname)
USER_NAME=$(whoami)
UPTIME_INFO=$(uptime -p)

LINE="========================================================"

echo "$LINE"
echo "              SYSTEM INFORMATION REPORT"
echo "$LINE"
echo
echo "Date       : $CURRENT_DATE"
echo "Hostname   : $HOST_NAME"
echo "Username   : $USER_NAME"
echo "Uptime     : $UPTIME_INFO"
echo

echo "$LINE"
echo "DISK USAGE"
echo "$LINE"
df -h
echo

echo "$LINE"
echo "RUNNING PROCESSES (top 10 by memory)"
echo "$LINE"
ps aux --sort=-%mem | head -11
echo

read -p "Enter a name for the report directory: " REPORT_DIR
read -p "Enter a name for the report file    : " REPORT_FILE

REPORT_DIR=${REPORT_DIR:-system_reports}
REPORT_FILE=${REPORT_FILE:-processes.txt}

REPORT_PATH="$REPORT_DIR/$REPORT_FILE"

mkdir -p "$REPORT_DIR"
touch "$REPORT_PATH"
ps aux > "$REPORT_PATH"

echo
echo "$LINE"
echo "Directory created : $REPORT_DIR"
echo "File created      : $REPORT_PATH"
echo "Lines written     : $(wc -l < "$REPORT_PATH")"
echo "File size         : $(du -h "$REPORT_PATH" | cut -f1)"
echo "$LINE"
echo
echo "First 5 lines of $REPORT_PATH:"
head -5 "$REPORT_PATH"
echo
echo "Report saved successfully."
