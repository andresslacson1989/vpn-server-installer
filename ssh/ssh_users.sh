#!/bin/bash
# My Telegram : https://t.me/bytesph2023
clear
while read expired
do
USERNAME="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $USERNAME | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $USERNAME | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
echo "$USERNAME"
fi
done < /etc/passwd