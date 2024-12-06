#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install papirus-icon-theme
rpm-ostree install qemu virt-manager edk2-ovmf
rpm-ostree install podman
rpm-ostree install sweet-gtk-theme obs-studio distrobox 
# Gnome extension as well as X11 support as it is disabled by default on Fedora 41+
rpm-ostree install gnome-shell-extension-gsconnect nautilus nautilus-gsconnect gnome-shell-extension-user-theme gnome-session-xsession xorg-x11-server-Xorg
# FileLight from KDE is only temporary until a 
rpm-ostree install filelight fastfetch
# Install VLC and Others - NOTICE - A web browser is not included 
rpm-ostree install flatseal host-spawn jetbrains-mono-fonts

#Driver installation - Nvidia refresh - Use 'akmod' driver which behaves likes the '-dkms' driver you see in arch based distros
#rpm-ostree install akmod-nvidia

#### Example for enabling a System Unit File
systemctl enable libvirtd
systemctl enable podman.socket
