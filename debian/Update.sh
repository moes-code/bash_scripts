#!/bin/bash

echo ""
echo "===== Updating your system ====="
echo ""

# APT
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y

echo ""
echo "===== System updated successfully ====="
echo ""
