sudo apt-get install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -Update 
sudo apt-get update
sudo apt-get install grafanaStart 
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
