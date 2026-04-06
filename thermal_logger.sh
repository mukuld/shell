#!/bin/bash

# Define the absolute path for the log file (important for cron)
LOG_FILE="/home/mukul/Documents/logs/thermal_log.csv"

# Write the header if the file doesn't exist
if [ ! -f "$LOG_FILE" ]; then
    echo "Timestamp,CPU_Temp,Memory_Temp(TM0S)" > "$LOG_FILE"
fi

# Extract the values using absolute paths for sensors
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
CPU_TEMP=$(/usr/bin/sensors | grep "Package id 0" | awk '{print $4}' | tr -d '+°C')
MEM_TEMP=$(/usr/bin/sensors | grep "TM0S" | awk '{print $2}' | tr -d '+°C')

# Append to the log
echo "$TIMESTAMP,$CPU_TEMP,$MEM_TEMP" >> "$LOG_FILE"
