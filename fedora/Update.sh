#!/bin/bash

echo ""
echo "===== Updating your system ====="
echo ""

# DNF
sudo dnf update -y
sudo dnf autoremove -y
sudo dnf clean all -y

# Flatpak
flatpak update -y
flatpak uninstall --unused -y

echo ""
echo "===== System updated successfully ====="
echo ""
