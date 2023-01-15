echo -e "Hello, $(whoami)!"
# Ask to continue
echo -e "Install configuration files?"
echo -n "(doing this will erase any previous configuration) [y/N] "

read "answer"

if [ "$answer" == "Y" -o "$answer" == "y" ]
then
  # Install pacman applications
  sudo pacman -S plasma-desktop 
  ark base-devel bleachbit docker docker-compose filelight firefox gimp git git gwenview handbrake inkscape kdenlive libreoffice-fresh mpv neofetch obsidian rsync systemctl telegram-desktop virtualbox vlc

  # Copy configuration to ~/.config folder
  sudo cp ./TTF/* /usr/share/fonts
  sudo cp ./vscode ~/.vscode
  sudo cp ./mozilla ~/.mozilla

  sudo cp -r ./kitty/ ./lf/ ./neofetch/ ./nvim/ ./obs-studio  ~/.config/
  sudo cp ./.bashrc ~/
  sudo cp ./lf/bin/* /usr/bin

  # Change ownership
  chown -R $USER: ~/.config/awesome ~/.config/kitty ~/.config/lf ~/.config/neofetch ~/.config/nvim ~/.config/picom ~/.config/rofi /usr/bin/lfub

  chmod u+x /usr/bin/lfub

  echo "Done :)"
else
  echo "Come back later! :)"
fi
