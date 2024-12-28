#!/bin/bash

# TODO - Switch from rpm-ostree to bootc ONCE UPSTREAM HAS FULLY SWITCHED

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"
### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf install papirus-icon-theme
dnf install qemu virt-manager edk2-ovmf
dnf install podman distrobox 
# Gnome extension as well as X11 support as it is disabled by default on Fedora 41+
dnf install gnome-shell-extension-gsconnect nautilus nautilus-gsconnect gnome-shell-extension-user-theme gnome-session-xsession xorg-x11-server-Xorg
# filelight
dnf install filelight papirus-icon-theme
# Icon themes and base packages for saucepan (https://github.com/tj5miniop/saucepan)
dnf install papirus-icon-theme
# Install VLC and Others - NOTICE - A web browser is not included 
dnf install host-spawn

#### Example for enabling a System Unit File
systemctl enable libvirtd
systemctl enable podman.socket
