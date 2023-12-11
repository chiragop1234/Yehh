# Use an official Ubuntu as a base image
FROM ubuntu:latest

# Update and upgrade packages
RUN apt update && apt upgrade -y

# Install necessary packages
RUN apt install -y systemctl curl sudo npm wget

# Clean npm cache and install Node.js stable version
RUN sudo npm cache clean -f && sudo npm install -g n && sudo n stable

# Install PufferPanel
RUN curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash
RUN sudo apt-get install -y pufferpanel

# Enable PufferPanel service
RUN sudo systemctl enable pufferpanel

# Add a PufferPanel user
RUN sudo pufferpanel user add --email chiragsadhwanivns@gmail.com --name foxytoux --password chirag123 --admin

# Enable and start PufferPanel service
RUN sudo systemctl enable --now pufferpanel
