#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "[+] Installing required packages..."
sudo apt-get update
sudo apt-get install -y wget apt-transport-https gnupg lsb-release

echo "[+] Adding Trivy GPG key..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -

echo "[+] Adding Trivy repo to sources list..."
echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | \
sudo tee /etc/apt/sources.list.d/trivy.list

echo "[+] Updating package list..."
sudo apt-get update

echo "[+] Installing Trivy..."
sudo apt-get install -y trivy

echo "[✔] Trivy installation completed!"
