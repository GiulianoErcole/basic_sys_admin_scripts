#!/bin/bash

# Define functions
function create_user() {
  echo "Creating user..."
  sudo useradd -m -s /bin/bash newuser
}

function delete_user() {
  echo "Deleting user..."
  sudo userdel -r newuser
}

function modify_user() {
  echo "Modifying user..."
  sudo usermod -aG sudo newuser
}

function reset_user_password() {
  echo "Resetting user password..."
  sudo passwd newuser
}

function configure_user_accounts() {
  echo "Configuring user accounts..."
  sudo useradd -m -s /bin/bash newuser
}

# Main script
echo "User Management"
create_user
modify_user
reset_user_password
delete_user
configure_user_accounts
