#!/bin/bash


echo "0 0 * * 0 (apt update -y && apt upgrade -y) > /var/log/update-\$(date +%Y%m%d).log 2>&1" >> /etc/cron.weekly/update.sh

chmod +x /etc/cron.weekly/update.sh
crontab -u root /etc/cron.weekly/update.sh
systemctl stop cron.service && systemctl start cron.service



touch /etc/logrotate.d/update
echo "/var/log/update-20*.log {
  rotate 3
  monthly
  compress
}
" >> /etc/logrotate.d/update

