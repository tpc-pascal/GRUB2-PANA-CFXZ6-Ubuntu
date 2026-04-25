#!/usr/bin/env bash

SETDIR="$(dirname "$(readlink -f "$0")")"
SRCDIR="$SETDIR/src/Checkpoint"

echo "--- Dang bat dau thiet lap Ubuntu tu src/Checkpoint ---"

# Cai dat PPA
if [ -f "$SRCDIR/ppa_list.txt" ]; then
    while read -r ppa; do
        sudo add-apt-repository "$ppa" -y
    done < "$SRCDIR/ppa_list.txt"
fi

sudo apt update
sudo apt install dselect -y

# Khoi phuc goi APT
sudo dpkg --set-selections < "$SRCDIR/packages.txt"
sudo apt-get dselect-upgrade -y

# Khoi phuc goi Snap
while read -r s; do 
    sudo snap install "$s" 2>/dev/null || sudo snap install "$s" --classic 2>/dev/null
done < "$SRCDIR/snaps.txt"

# Khoi phuc cau hinh giao dien va phim tat
if [ -f "$SRCDIR/configs/full_settings.dconf" ]; then
    dconf load / < "$SRCDIR/configs/full_settings.dconf"
fi

# Khoi phuc file ca nhan
cp -f "$SRCDIR/configs/.bashrc" ~/
cp -f "$SRCDIR/configs/.profile" ~/

# Tuy chinh GNOME
gsettings set org.gnome.SessionManager logout-prompt false

# Cau hinh Pin va Gio cho CF-XZ6
if dpkg -l | grep -q "tlp"; then
    sudo tlp start
    sudo systemctl enable tlp.service
fi
timedatectl set-local-rtc 1 --adjust-system-clock

echo "--- Hoan thanh qua trinh cai dat ---"