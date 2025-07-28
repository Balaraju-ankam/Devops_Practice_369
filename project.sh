#!/bin/bash

# Thresholds
CPU_LIMIT=80 # in percent
MEM_LIMIT=80 # in percent
DISK_LIMIT=80 # in percent
ALERT_EMAIL="ankambalraj2512@gmail.com"

# Get current usage
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USED=$(free | awk '/Mem/{printf("%.0f"), $3/$2 * 100.0}')
DISK_USED=$(df -h / | awk 'NR==2 {gsub(/%/,"",$5); print $5}')

# Alert function
alert() {
  SUBJECT="[$(hostname)] ALERT: $1"
    MESSAGE="$2"
      echo "$MESSAGE" | mail -s "$SUBJECT" "$ALERT_EMAIL"
      }

      # Check CPU
      if (( ${CPU_LOAD%.*} > CPU_LIMIT )); then
        alert "High CPU Usage" "CPU is at $CPU_LOAD%"
        fi

        # Check MEM
        if (( MEM_USED > MEM_LIMIT )); then
          alert "High Memory Usage" "Memory usage is at $MEM_USED%"
          fi

          # Check DISK
          if (( DISK_USED > DISK_LIMIT )); then
            alert "Disk Space Low" "Disk usage on / is at $DISK_USED%"
            fi
            
