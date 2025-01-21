#!/bin/bash

# Define functions
function disable_unnecessary_services() {
  echo "Disabling unnecessary services..."
  sudo systemctl disable apache2
}

function configure_firewall_rules() {
  echo "Configuring firewall rules..."
  sudo ufw allow ssh
}

function install_security_packages() {
  echo "Installing security packages..."
  sudo apt install -y clamav fail2ban
}

function configure_system_logging() {
  echo "Configuring system logging..."
  sudo systemctl enable rsyslog
}

function configure_system_updates() {
  echo "Configuring system updates..."
  sudo apt update
  sudo apt full-upgrade -y
}

# Main script
echo "System Hardening"
disable_unnecessary_services
configure_firewall_rules
install_security_packages
configure_system_logging
configure_system_updates
