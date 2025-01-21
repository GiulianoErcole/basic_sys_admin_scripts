#!/bin/bash

# Define functions
function backup_files() {
  echo "Backing up files..."
  sudo rsync -avz /etc/ /home/ /var/ /backup/
}

function backup_databases() {
  echo "Backing up databases..."
  sudo mysqldump -u root -p mysql > /backup/mysql.sql
}

function backup_system_image() {
  echo "Backing up system image..."
  sudo dd if=/dev/sda of=/backup/system_image.img
}

function configure_backup_schedule() {
  echo "Configuring backup schedule..."
  sudo crontab -e
}

# Main script
echo "Backup"
backup_files
backup_databases
backup_system_image
configure_backup_schedule
