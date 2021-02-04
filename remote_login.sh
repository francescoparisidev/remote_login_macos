result=$(sudo systemsetup -getremotelogin)
if [[ $result == *"Off"* ]]
then
    while true; do
        read -p "OFF, Do you want to turn-on? (y/n) " yn
        case $yn in
            [Yy]* ) sudo launchctl load /System/Library/LaunchDaemons/ssh.plist; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    while true; do
        read -p "ON, Do you want to turn-off? (y/n) " yn
        case $yn in
            [Yy]* ) sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist; break;;
            [Nn]* ) exit;;
        esac
    done
fi