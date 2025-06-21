#!/bin/bash

# Update package index
sudo apt update -y

# Install OpenJDK 17
sudo apt install -y openjdk-17-jdk

# Add Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository to the sources list
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package index with Jenkins repo
sudo apt update

# Install Jenkins
sudo apt install -y jenkins
