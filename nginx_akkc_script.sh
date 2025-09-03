#!/bin/bash

# Update package index
sudo apt update

# Install nginx and git
sudo apt install -y nginx git

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Clear default nginx web root
sudo rm -rf /var/www/html/*

# Define temp directory for cloning
TEMP_DIR="/tmp/akkc_portfolio"
rm -rf $TEMP_DIR
mkdir -p $TEMP_DIR

# Clone your GitHub repo
git clone https://github.com/akkc01/akkc_portfolio.git $TEMP_DIR

# Copy content from inner folder (repo name = akkc_portfolio)
sudo cp -r $TEMP_DIR/akkc_portfolio/* /var/www/html/

# Fix permissions
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
