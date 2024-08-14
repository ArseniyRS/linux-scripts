sudo apt update && sudo apt upgrade -y
sudo apt install -y gnome-tweaks gnome-shell-extensions

# Theme installing
THEME_REPO="https://github.com/vinceliuice/Graphite-gtk-theme.git"
INSTALL_THEME_CMD="$HOME/Downloads/themes/Graphite-gtk-theme/install.sh --tweaks float colorful nord rimless -t teal"
git clone $THEME_REPO $HOME/Downloads/themes
$INSTALL_THEME_CMD
gsettings set org.gnome.desktop.interface gtk-theme "Graphite-teal-Dark-nord"

#Icons installing
ICONS_REPO="https://github.com/vinceliuice/Tela-circle-icon-theme.git"
INSTALL_ICONS_CMD="$HOME/Downloads/icons/Tela-circle-icon-theme/install.sh -c -a"
git clone $ICONS_REPO $HOME/Downloads/icons
$INSTALL_ICONS_CMD
gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-manjaro-dark"

#Cursors installing
CURSORS_REPO="https://github.com/vinceliuice/Layan-cursors.git"
INSTALL_CURSORS_CMD="$HOME/Downloads/cursors/Layan-cursors/install.sh"
git clone $CURSORS_REPO $HOME/Downloads/cursors
$INSTALL_CURSORS_CMD
gsettings set org.gnome.desktop.interface cursor-theme "Layan-border-cursors"

# Font installing
cp ./fonts/* $HOME/.local/share/fonts
gsettings set org.gnome.desktop.interface monospace-font-name "MesloLGL Nerd Font Mono 11"

#Gnome extentions and settings installing
while IFS= read -r line; do
    gnome-extensions install "$line" && gnome-extensions enable "$line"
    echo "Installed and enabled $line"
done < ./backup/gnome.extentions.txt
dconf load /org/gnome/shell/extensions/ < ./backup/gnome-extensions-settings-backup.dconf
echo 'Gnome extentions settings are loaded'

#Other settings
mkdir -p $HOME/.local/share/backgrounds && cp ./bg.jpg $HOME/.local/share/backgrounds
gsettings set org.gnome.desktop.background $HOME/.local/share/backgrounds/bg.jpg
gsettings set org.gnome.desktop.interface clock-format "24h"

gnome-shell --replace
