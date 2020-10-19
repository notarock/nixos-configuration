#!/usr/bin/env bash
set -euo pipefail

echo "Gives permission to ssh keys"
sudo chmod 700 ~/.ssh
sudo chmod 644 ~/.ssh/known_hosts
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 644 ~/.ssh/id_rsa.pub

cd /nixos-configuration && git remote remove origin && \
    git remote add origin git@github.com:notarock/nixos-configuration.git

read -p "Overwrite current ~/.emacs.d and install doom? (y/n)" -n 1 -r
echo "..."
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -rf ~/.emacs.d
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
fi

git clone git@github.com:notarock/.doom.d.git ~/.doom.d
git clone git@github.com:notarock/pass.git ~/.password-store

ln -s ~/Nextcloud/Pictures/ ~/Pictures
ln -s ~/Nextcloud/Documents/ ~/Documents
ln -s ~/Nextcloud/Videos/ ~/Videos
ln -s ~/Nextcloud/Music ~/Music