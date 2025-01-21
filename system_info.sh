#!/bin/bash

# Define functions
function get_cpu_info() {
  echo "CPU Architecture: $(uname -m)"
  echo "CPU Cores: $(nproc --all)"
  echo "CPU Frequency: $(cat /proc/cpuinfo | grep "cpu MHz" | awk '{print $4}')"
  echo "CPU Model: $(cat /proc/cpuinfo | grep "model name" | awk '{print $4}')"
  echo "CPU Cache Size: $(cat /proc/cpuinfo | grep "cache size" | awk '{print $4}')"
}

function get_memory_info() {
  echo "Memory Total: $(free -h | grep "Mem:" | awk '{print $2}')"
  echo "Memory Used: $(free -h | grep "Mem:" | awk '{print $3}')"
  echo "Memory Available: $(free -h | grep "Mem:" | awk '{print $7}')"
  echo "Swap Total: $(free -h | grep "Swap:" | awk '{print $2}')"
  echo "Swap Used: $(free -h | grep "Swap:" | awk '{print $3}')"
}

function get_disk_info() {
  echo "Disk Total: $(df -h | grep "/dev/" | awk '{print $2}')"
  echo "Disk Used: $(df -h | grep "/dev/" | awk '{print $3}')"
  echo "Disk Available: $(df -h | grep "/dev/" | awk '{print $4}')"
  echo "File System: $(df -h | grep "/dev/" | awk '{print $6}')"
  echo "Disk Type: $(lsblk -d -o NAME,TYPE | grep "/dev/" | awk '{print $2}')"
}

function get_network_info() {
  echo "Network Interface: $(ip link show | grep "link/ether" | awk '{print $2}')"
  echo "Network IP Address: $(ip addr show | grep "inet " | awk '{print $2}')"
  echo "Network Subnet Mask: $(ip addr show | grep "inet " | awk '{print $4}')"
  echo "Network Gateway: $(ip route show | grep "default" | awk '{print $3}')"
  echo "Network DNS Server: $(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}')"
}

# Main script
echo "System Information"
get_cpu_info
get_memory_info
get_disk_info
get_network_info
