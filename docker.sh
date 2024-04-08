##Install in Amazon Ubuntu
#!/bin/bash
sudo apt update -y

#!/bin/bash

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
echo "Installing Docker Compose..."
sudo apt-get update
sudo apt-get install -y docker-compose

# Create Jenkins User
echo "Creating jenkins user..."
sudo useradd -m -s /bin/bash jenkins

# Add Jenkins to Docker Group
echo "Adding jenkins user to the docker group..."
sudo usermod -aG docker jenkins

# Allow Jenkins to access Docker socket
echo "Configuring Jenkins to access Docker socket..."
sudo groupadd docker
sudo usermod -aG docker jenkins
sudo chmod 777 /var/run/docker.sock

# Restart Jenkins service
echo "Restarting Jenkins service..."
sudo systemctl restart docker
sudo systemctl enable docker
echo "Configuration completed."

#sudo systemctl status docker

sudo chmod 777 /var/run/docker.sock
