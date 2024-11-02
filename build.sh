#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#rpm-ostree install screen

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

# systemctl enable podman.socket



# Package Install
# ===========================

#Others
dnf install -y screen mpv


# Netbird
tee /etc/yum.repos.d/netbird.repo <<EOF
[netbird]
name=netbird
baseurl=https://pkgs.netbird.io/yum/
enabled=1
gpgcheck=0
gpgkey=https://pkgs.netbird.io/yum/repodata/repomd.xml.key
repo_gpgcheck=1
EOF

dnf install -y netbird

#TEST 64BIT GSTREAMER
rpm-ostree install gstreamer1 gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-libav gstreamer1-tools gstreamer1-gtk gstreamer1-qt gstreamer1-alsa gstreamer1-pulseaudio gstreamer1-gl

#TEST 32BIT GSTREAMER
rpm-ostree install gstreamer1.i686 gstreamer1-plugins-base.i686 gstreamer1-plugins-good.i686 gstreamer1-plugins-bad-free.i686 gstreamer1-plugins-bad-free-extras.i686 gstreamer1-plugins-ugly.i686 gstreamer1-libav.i686 gstreamer1-tools.i686 gstreamer1-gtk.i686 gstreamer1-qt.i686 gstreamer1-alsa.i686 gstreamer1-pulseaudio.i686 gstreamer1-gl.i686

#Gstreamer 64bits
#rpm-ostree install gstreamer1 gstreamer1-vaapi gstreamer1-plugin-libav gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer1-plugins-ugly-free

#Gstreamer 32bits
#rpm-ostree install gstreamer1.i686 gstreamer1-vaapi.i686 gstreamer1-plugins-base.i686 gstreamer1-plugins-good.i686 gstreamer1-plugins-bad-free.i686 gstreamer1-plugins-ugly-free.i686
