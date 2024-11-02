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


# Gstreamer ALL 64 bits
rpm-ostree install gstreamer1 gstreamer1-devel gstreamer1-plugins-good gstreamer1-plugins-good-extras gstreamer1-plugins-good-gtk gstreamer1-plugins-good-qt gstreamer1-plugins-good-qt6 gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-free-fluidsynth gstreamer1-plugins-bad-free-libs gstreamer1-plugins-bad-free-opencv gstreamer1-plugins-bad-free-wildmidi gstreamer1-plugins-bad-free-zbar gstreamer1-plugins-ugly-free gstreamer1-plugins-base gstreamer1-plugins-base-tools gstreamer1-vaapi gstreamer1-vaapi-devel gstreamer1-plugin-openh264 gstreamer1-plugin-libav gstreamer1-plugin-gif gstreamer1-plugin-gtk4

# Gstreamer ALL 32bits
rpm-ostree install gstreamer1.i686 gstreamer1-devel.i686 gstreamer1-plugins-good.i686 gstreamer1-plugins-good-extras.i686 gstreamer1-plugins-good-gtk.i686 gstreamer1-plugins-good-qt.i686 gstreamer1-plugins-bad-free-fluidsynth.i686 gstreamer1-plugins-bad-free-libs.i686 gstreamer1-plugins-bad-free-opencv.i686 gstreamer1-plugins-bad-free-wildmidi.i686 gstreamer1-plugins-bad-free-zbar.i686 gstreamer1-plugins-ugly-free.i686 gstreamer1-plugins-base.i686 gstreamer1-vaapi.i686 gstreamer1-vaapi-devel.i686 gstreamer1-plugin-openh264.i686 gstreamer1-plugin-gif gstreamer1-plugin-gtk4.i686 gstreamer1-plugins-bad-free.i686 gstreamer1-plugins-bad-free.i686

#Removed
#gstreamer1-plugins-base-devel gstreamer1-plugins-base-devel.i686 gstreamer1-plugins-bad-free-devel gstreamer1-plugins-bad-free-devel.i686 gstreamer1-plugin-libav.i686 gstreamer1-plugins-good-qt6.i686 gstreamer1-plugins-base-tools.i686 gstreamer1-plugins-bad-free-extras.i686


#Gstreamer 64bits
#rpm-ostree install gstreamer1 gstreamer1-vaapi gstreamer1-plugin-libav gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer1-plugins-ugly-free

#Gstreamer 32bits
#rpm-ostree install gstreamer1.i686 gstreamer1-vaapi.i686 gstreamer1-plugins-base.i686 gstreamer1-plugins-good.i686 gstreamer1-plugins-bad-free.i686 gstreamer1-plugins-ugly-free.i686
