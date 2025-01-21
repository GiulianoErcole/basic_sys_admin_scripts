#!/bin/bash

# Define functions
function configure_network_interface() {
  echo "Configuring network interface..."
  sudo ip link set eth0 up
}

function configure_network_ip_address() {
  echo "Configuring network IP address..."
  sudo ip addr add 192.168.1.100/24 dev eth0
}

function configure_network_subnet_mask() {
  echo "Configuring network subnet mask..."
  sudo ip addr add 255.255.255.0/24 dev eth0
}

function configure_network_gateway() {
  echo "Configuring network gateway..."
  sudo ip route add default via 192.168.1.1 dev eth0
}

function configure_network_dns_server() {
  echo "Configuring network DNS server..."
  sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
}

# Main script
echo "Network Configuration"
configure_network_interface
configure_network_ip_address
configure_network_subnet_mask
configure_network_gateway
configure_network_dns_server
