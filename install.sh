#/bin/bash

# Install mqtt broker.
sudo apt update
sudo apt install -y mosquitto

# Added repo and microsoft key.
curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list > ./microsoft-prod.list
sudo cp ./microsoft-prod.list /etc/apt/sources.list.d/
rm ./microsoft-prod.list
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo cp ./microsoft.gpg /etc/apt/trusted.gpg.d/
rm ./microsoft.gpg
sudo apt update

# install moby-engine
sudo apt-get install -y moby-engine

### Not for production!
sudo apt-get install -y moby-cli

# Install IOT EDGE
sudo apt-get install -y iotedge

## Do the provisioning, ensure correct config!

# Restart iotedge
sudo systemctl restart iotedge

# Verify if the iotedge is functioning correctly.
# systemctl status iotedge
# journalctl -u iotedge --no-pager --no-full
# sudo iotedge check
# sudo iotedge list
