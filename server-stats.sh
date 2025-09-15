echo "CPU USAGE #######################################"
lscpu |
    grep ".*CPU(s).*:*[0-9]\+%" | # ensures it works in different locales (tested with en, de)
    grep -o '[0-9]\+%' # get the cpu usage percentage only


echo -e "\nMEMORY FREE / AVAILABLE ##################"
meminfo=$(grep -E "MemTotal|MemFree|MemAvailable" /proc/meminfo)
MemTotal=$(echo "$meminfo" | grep MemTotal | awk '{print $2}')
MemFree=$(echo "$meminfo" | grep MemFree | awk '{print $2}')
MemAvailable=$(echo "$meminfo" | grep MemAvailable | awk '{print $2}')

echo "$((MemFree * 100 / MemTotal))% free"
echo "$((MemAvailable * 100 / MemTotal))% available"

echo -e "\nDISK USAGE (ROOT PARTITION) #####################"
df -h --local | grep ".*/$" | awk '{print $5}' # get usage of root partition only

echo -e "\nTOP 5 PROCESSES BY CPU USAGE ####################"
ps -eo comm,%cpu --sort=-%cpu | head -6

echo -e "\nTOP 5 PROCESSES BY MEMORY USAGE #################"
ps -eo comm,rss --sort=-%mem --no-headers | head -5 | awk '{printf "%-9s\t%8.1f MB\n", $1, $2/1024}'