#!/bin/bash

# Ask questions at the beggining without depending on chezmoi,
# so that we don't have a bootstrapping problem
read -p "Is this a work computer? [y/n] " yn

case $yn in 
    [yY]) export WORK_ENV=1 ;;
	[nN]) export WORK_ENV=0 ;;
	* ) exit 1 ;;
esac
sudo pacman -Syu --noconfirm

sudo pacman -S doas --noconfirm

# Esto se tiene que ejecutar como root
# echo -e "permit :wheel" >> /etc/doas.conf && chmod -c 0400 /etc/doas.conf
# usermod -aG wheel julian
# usermod -aG audio julian # Para tener acceso al audio
# usermod -aG input julian # Para poder ejecutar kmonad

declare -a pacman_packages=(nodejs npm rust python python-pip python-dbus pyenv neovim git curl lua-jsregexp
yarn ttf-fira-code ttf-fantasque-nerd python-wheel syncthing inotify-tools zsh fzf fzy xclip feh xdotool chezmoi
alacritty kitty python-xattr thefuck tealdeer bat man-pages flameshot fortune-mod
graphviz
go unzip #lua, clang lsp in neovim
flatpak
i3-wm i3lock i3status unclutter lazygit okular rofi passmenu dmenu wmctrl wmfocus
fuse2 bluez bluez-utils docker docker-buildx plantuml
alsa-utils # alsamixer, aplay
emacs-nativecomp
ripgrep
man cronie libreoffice-fresh fd xorg-xinput xorg-xkill ntfs-3g
calibre gwenview evince
firefox chromium
qmk
xdg-desktop-portal xdg-desktop-portal-kde # Add GTK_USE_PORTAL=1 to /etc/environment
noto-fonts-emoji
noto-fonts-cjk # Chinese Japanese Korean fonts
pinta kolourpaint
redshift
gnome-keyring
print-manager
rebuild-detector pacman-contrib # pacman utilities
# https://wiki.archlinux.org/title/TeX_Live
texlive)

if (( $WORK_ENV == 1)); then
    pacman_packages+=(rclone evolution evolution-ews kubectl kubectx k9s cmctl github-cli remmina)
fi

sudo pacman -S "${pacman_packages[@]}" --noconfirm

git clone https://aur.archlinux.org/paru-bin.git ~/.local/share/paru-bin && cd ~/.local/share/paru-bin || exit 1
makepkg -sri --noconfirm

declare -a paru_packages=(activitywatch-bin kmonad espanso-bin shellcheck-bin google-chrome
pandoc-bin bookmarksync-git ferdium-bin notion-app drawio-desktop-bin
ttf-ms-win11-auto # Windows fonts
adobe-base-14-fonts # adobe
winff
samsung-unified-driver system-config-printer # Printer driver and config
qmk-udev-rules-git # QMK
emacs-pdf-tools-git # To avoid error while loading shared libraries: libpoppler.so.XXX
anki
cpulimit
)
if (( $WORK_ENV == 1 )); then
    # google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin # install without pacman
    # You cannot perform this action because this Google Cloud CLI installation is managed by an external package manager
    paru_packages+=(teams onedrive-abraunegg)
fi
if (( $WORK_ENV == 1 )); then
    cd ~/.local/share
    gcloud_file=$(curl -Ssl https://cloud.google.com/sdk/docs/install | grep -F 'curl -O' | sed -E 's/.+(google-cloud-cli-[0-9]+\.[0-9]+\.[0-9]+-linux-x86_64.tar.gz).+/\1/')
    curl -O "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$gcloud_file"
    tar -xf "$gcloud_file"
    ./google-cloud-sdk/install.sh --usage-reporting false --path-update false --command-completion false
    gcloud components install gke-gcloud-auth-plugin
fi

paru -S "${paru_packages[@]}" --noconfirm

declare -a systemctl_enable=(NetworkManager bluetooth cups.service docker.socket docker.service containerd.service cronie.service)
declare -a systemctl_enable_user=(espanso.service syncthing redshift)

if (( $WORK_ENV == 1 )); then
    declare -a flathub_packages=(io.dbeaver.DBeaverCommunity)

    flatpak install flathub "${flathub_packages[@]}"
fi

# MAYBE Add a --now to enable and start the service

for service in "${systemctl_enable[@]}"; do
    sudo systemctl enable "$service"
done

for service in "${systemctl_enable_user[@]}"; do
    systemctl enable --user "$service"
done

mkdir -p ~/.config/autostart

echo "[Desktop Entry]
Type=Application
Version=1.0
Name=flameshot
Comment=flameshot start script
Exec=/usr/bin/flameshot
StartupNotify=false
Terminal=true" > ~/.config/autostart/flameshot.desktop

echo "[Desktop Entry]
Type=Application
Version=1.0
Name=unclutter
Comment=unclutter start script
Exec=/usr/bin/unclutter --timeout 1
StartupNotify=false
Terminal=true" > ~/.config/autostart/unclutter.desktop

echo "[Desktop Entry]
Type=Application
Version=1.0
Name=emacs
Comment=emacs start script
Exec=/usr/bin/emacs --daemon
StartupNotify=false
Terminal=true" > ~/.config/autostart/emacs.desktop

if (( $WORK_ENV == 1 )); then
    Name=rclone mount
    Comment=rclone mount start script
    echo "[Desktop Entry]
    Type=Application
    Version=1.0
    Exec=rclone --vfs-cache-mode writes mount gdrive:  /media/julian/gdrive
    StartupNotify=false
    Terminal=true" > ~/.config/autostart/rclone.desktop
    echo "[Desktop Entry]
    Type=Application
    Version=1.0
    Name=rclone mount
    Comment=rclone mount start script
    Exec=rclone --vfs-cache-mode writes mount julian:  /media/julian/julian
    StartupNotify=false
    Terminal=true" > ~/.config/autostart/rclone_julian.desktop
    echo "[Desktop Entry]
    Type=Application
    Version=1.0
    Name=evolution
    Comment=evolution
    Exec=evolution
    StartupNotify=false
    Terminal=true" > ~/.config/autostart/evolution.desktop
fi

cd
echo "Continuar cuando estén las carpetas ya sincronizadas:"
echo "ls ~/.device-keys ~/.credentials ~/.password-store"
read -r

gpg --import ~/.credentials/private.key
gpg --decrypt --recipient rpi@rpi ~/.device-keys/personal.gpg > /tmp/personal
gpg --import /tmp/personal
mkdir -p ~/.ssh && find ~/.password-store/home/julian/.ssh/ -type f | xargs -I _ bash -c 'gpg -d _ > $(echo _ | sed -e s#/home/julian/.password-store## -e s/\.gpg$//) && chmod 600 $(echo _ | sed -e s#/home/julian/.password-store## -e s/\.gpg$//)'

pip install lxml
systemctl --user stop syncthing
    python remove.py "/home/julian/.credentials"
systemctl --user start syncthing
rm -rf /home/julian/.credentials

gpg --delete-secret-keys rpi@rpi
gpg --delete-keys rpi@rpi

rm /tmp/personal

# Suponiendo que tengo ya instaladas las claves
git clone git@github.com:lytex/dotfiles.git ~/.local/share/chezmoi/

# Repositorios privados con credenciales
# {{ if .work }}
if (( $WORK_ENV == 1 )); then
    git clone git@github.com:lytex/dotfiles.git ~/.local/share/chezmoi/dot_ssh
else
    git clone git@github.com:lytex/dot_ssh_personal.git ~/.local/share/chezmoi/dot_ssh
fi

chezmoi init # Responder a unas preguntas aquí, buen momento para parar la instalación.
# Puedo utilizar un token de github para bajarme los chezmoi, y aprovechar esto para configurar las claves, pero entonces tengo que sustituir luego el remote de este repo

# Aquí tengo un paso raro porque tengo que clonar primero ~/.doom.d porque ya he empezado a meter cosas en chezmoi, cuando migre todo a chezmoi estará bien
# Si lo clono después me da error porque el directorio ya existe
git clone ssh://git@github.com/lytex/doom.d ~/.doom.d
chezmoi apply


git clone lytex_space_git:~/org ~/org

echo "Continuar cuando estén las carpetas ya sincronizadas:"
echo "ls ~/org"
read -r
cd ~/.doom.d && git submodule init org-html-themes && git submodule sync org-html-themes && git submodule update org-html-themes; cd -
mkdir -p ~/.config/emacs && cd ~/.config/emacs || exit 1
git init .
git remote add origin https://github.com/doomemacs/doomemacs
git fetch --depth 1 origin 90b1b221fe7c20f2edef341a780e194cd22c7daa # emacs 29.1
# git fetch --depth 1 origin d5ccac5d71c819035fa251f01d023b3f94b4fba4 # Actualizado a v3.0.0-pre
# d0cdf8f5c6ca7ebaae371a54a3114193d876ce51 # El último antes de eliminar init.el que funcione
# 9d52ba27472634724d7ae5195033161b5121b1b4 es el siguiente que funciona? 
# https://github.com/doomemacs/doomemacs/issues/6852#issuecomment-1259140811
git checkout FETCH_HEAD
yes | ~/.config/emacs/bin/doom install 
~/.config/emacs/bin/doom install # !Aquí dependo de que esté sincronizado ~/org con Syncthing! porque hace falta org-ql-queries.el
ln -s ~/org/org-ql-queries.el ~/.doom.d/modules/ # Y luego además linkarla

# QMK
cd "$HOME/qmk_firmware/"
git init .
git remote add origin https://github.com/qmk/qmk_firmware
git fetch --depth 1 origin 11308345135952db9767d1bd770cd1e25609d4ee
git checkout FETCH_HEAD

make git-submodule
qmk config user.keyboard=contra
qmk setup
qmk config user.keyboard=ydm40
qmk setup

tldr --update # Para que tenga cache tldr por si no hay conexión
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
RUNZSH="no" # TODO En teoría para evitar que ohmyzsh lance una terminal interactiva, pero no me funciona
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/andydecleyre/zpy "$ZSH_CUSTOM/plugins/zpy"
mkdir -p "$HOME/.zsh/plugins"
git clone https://github.com/kutsan/zsh-system-clipboard "$HOME/.zsh/plugins/zsh-system-clipboard"
chezmoi apply --force

# TODO Paso manual: https://github.com/flameshot-org/flameshot#on-kde-plasma-desktop

cargo install stylua
npm install --save-dev --save-exact prettier
pip3 install isort pylint flake8 black --user

systemctl mask plasma-kwin_x11.service --user
systemctl enable plasma-i3 --user

plasma-apply-colorscheme BreezeDark
plasma-apply-lookandfeel -a org.kde.breezedark.desktop
plasma-apply-desktoptheme breeze-dark
plasma-apply-cursortheme Quintom_Ink

pip3 install neovim-remote
git clone https://github.com/slembcke/debugger.lua ~/.local/share/debugger.lua
git clone https://github.com/hakimel/reveal.js ~/.local/share/reveal.js

sudo groupadd docker
sudo usermod -aG docker "$USER"
sudo usermod -aG audio "$USER"
newgrp docker

mkdir -p ~/.local/share/wallpapers
ln -s /usr/share/wallpapers/Next/contents/images/5120x2880.* ~/.local/share/wallpapers/i3-wallpaper
mkdir -p ~/.local/share/applications
cp ~/.doom.d/org-roam-capture/org-protocol.desktop ~/.local/share/applications/org-protocol.desktop
xdg-mime default org-protocol.desktop x-scheme-handler/org-protocol
cp ~/.doom.d/emacs/emacs_client.desktop ~/.local/share/applications/emacs_client.desktop

# Si no por defecto abre todos los links en chrome
xdg-settings set default-web-browser firefox.desktop

chmod 700 ~/Documents
# vim: sw=4 ts=4 wm=4 et ft=bash
