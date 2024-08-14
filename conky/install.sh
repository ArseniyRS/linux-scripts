sudo apt update && sudo apt upgrade -y
sudo apt install -y conky lua curl jq playerctl

echo 'Copying conky theme...'
mkdir -p $HOME/.config/conky/Arrakis && cp -r ./Arrakis/* $HOME/.config/conky/Arrakis

# fonts
echo 'Copying fonts...'
cp $HOME/.config/conky/Arrakis/fonts/* $HOME/.fonts
sudo fc-cache -f

#wlp
NEW_INTERFACE=$(ip link | grep -oP 'wlp\d+s\d+(?=:)')
sed -i "s/wlp1s1/$NEW_INTERFACE/g" $HOME/.config/conky/Arrakis/Arrakis.conf

echo 'Sync conky theme autostart...'
rsync -av $HOME/.config/conky/Arrakis/autostart $HOME/.config/autostart

gnome-shell --replace