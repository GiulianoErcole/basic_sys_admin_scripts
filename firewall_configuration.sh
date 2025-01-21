#!/bin/bash

# Define functions
function configure_firewall_rules() {
  echo "Configuring firewall rules..."
  sudo ufw allow http
  sudo ufw allow https
  sudo ufw allow ssh
}

function configure_firewall_logging() {
  echo "Configuring firewall logging..."
  sudo ufw logging on
}

function configure_firewall_rate_limiting() {
  echo "Configuring firewall rate limiting..."
  sudo ufw limit ssh
}

function configure_firewall_rule_order() {
  echo "Configuring firewall rule order..."
  sudo ufw status numbered
}

# Main script
echo "Firewall Configuration"
configure_firewall_rules
configure_firewall_logging
configure_firewall_rate_limiting
configure_firewall_rule_order
