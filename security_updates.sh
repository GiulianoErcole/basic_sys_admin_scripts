#!/bin/bash

# Define functions
function update_packages() {
  echo "Updating packages..."
  sudo apt update
  sudo apt full-upgrade -y
}

function install_security_packages() {
  echo "Installing security packages..."
  sudo apt install -y clamav fail2ban
}

function configure_firewall() {
  echo "Configuring firewall..."
  sudo ufw enable
  sudo ufw allow ssh
}

function scan_for_vulnerabilities() {
  echo "Scanning for vulnerabilities..."
  sudo nmap -sV 192.168.1.100
}

function configure_vulnerability_scanning() {
  echo "Configuring vulnerability scanning..."
  sudo nmap -sV --script=vuln 192.168.1.100
}

# Main script
echo "Security Updates"
update_packages
install_security_packages
configure_firewall
scan_for_vulnerabilities
configure_vulnerability_scanning
