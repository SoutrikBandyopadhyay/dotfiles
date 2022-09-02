#!/usr/bin/sh

configfile=".keyboard"
Icon="~/.config/keyboardDisable/meow.png"
Icoff="~/.config/keyboardDisable/Icoff.png"

out=$(xinput list | awk '/AT Translated Set 2 keyboard/')
ID=$(echo $out | awk -F '=' '{print $2}' | awk '{print $1}')
MASTER=$(echo $out | grep '(' | cut -d "(" -f2 | cut -d ")" -f1)
if [ -z "$MASTER" ]; then
    notify-send -i $Icon "Enabling Keyboard" \ "ON - Laptop Keyboard Connected"

    if [ ! -f $configfile ]; then
        echo "Please create a .keyboard config file with keyboard id followed by master ID with a space "
        exit 10
    else
        ID=$(cat $configfile | awk '{print $1}')
        MASTER=$(cat $configfile | awk '{print $2}')
        xinput reattach $ID $MASTER
    fi
    echo "Your Laptop keyboard is now enabled"
else
    notify-send -i $Icoff "Disabling Keyboard" \ "OFF - Laptop Keyboard Disconnected"
    if [ ! -f $configfile ]; then
        echo "Writing ID and Master to the config file"
        echo "$ID $MASTER" > $configfile
    fi
    xinput float $ID
    echo "Your Laptop keyboard is now disabled"
fi



# xmodmap -e 'keycode 172='
