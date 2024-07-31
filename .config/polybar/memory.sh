#!/bin/sh
case "$1" in
    --popup)
        notify-send "Memory (MB)" "$(ps -acuxh | awk '{print $6/1024" MB\t" $11}' | sort -rn | head)"
        ;;
    *)
        echo " $(free -h --si | awk '/^Mem:/ {print $3 "/" $2}')"
        ;;
esac
