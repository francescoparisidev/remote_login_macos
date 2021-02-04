result=$(sudo systemsetup -getremotelogin)
if [[ $result == *"Remote Login: Off"* ]]
then
    while true; do
        read -p "Off, Do you want to turn-on?" yn
        case $yn in
            [Yy]* ) sudo launchctl load /System/Library/LaunchDaemons/ssh.plist; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    while true; do
        read -p "On, Do you want to turn-off?" yn
        case $yn in
            [Yy]* ) sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist; break;;
            [Nn]* ) exit;;
        esac
    done
fi