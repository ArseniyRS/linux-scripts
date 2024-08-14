#Plugins
sudo apt install exa
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
NEW_PLUGINS='
  zsh-syntax-highlighting
  zsh-autosuggestions'
ZSH_PLUGINS=$(grep '^plugins=' $HOME/.zshrc | sed 's/plugins=(//' | sed 's/)//' | tr ' ' '\n')
UPDATED_PLUGINS=$ZSH_PLUGINS

for plugin in $NEW_PLUGINS; do
  if ! echo "$ZSH_PLUGINS" | grep -q "^$plugin$"; then
    UPDATED_PLUGINS="$UPDATED_PLUGINS $plugin"
  fi
done

sed -i "s/^plugins=.*/plugins=($UPDATED_PLUGINS)/" $HOME/.zshrc

source $HOME/.zshrc