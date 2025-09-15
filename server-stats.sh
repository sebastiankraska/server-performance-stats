### CPU ###
lscpu |
    grep ".*CPU(s).*:*[0-9]\+%" | # ensures it works in different locales (tested with en, de)
    grep -o '[0-9]\+%' # get the cpu usage percentage only

### MEMORY ###
meminfo=$(grep -E "MemTotal|MemFree|MemAvailable" /proc/meminfo)
MemTotal=$(echo "$meminfo" | grep MemTotal | awk '{print $2}')
MemFree=$(echo "$meminfo" | grep MemFree | awk '{print $2}')
MemAvailable=$(echo "$meminfo" | grep MemAvailable | awk '{print $2}')

echo "Memory:" \
    "$((MemFree * 100 / MemTotal))% free," \
    "$((MemAvailable * 100 / MemTotal))% available"

### DISK ###

### TOP 5 BY CPU USAGE ###

### TOP 5 BY MEMORY USAGE ###