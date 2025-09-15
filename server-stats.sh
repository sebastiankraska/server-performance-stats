lscpu |
    grep ".*CPU(s).*:*[0-9]\+%" | # ensures it works in different locales (tested with en, de)
    grep -o '[0-9]\+%' # get the cpu usage percentage only



