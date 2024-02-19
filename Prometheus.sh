wget https://github.com/prometheus/prometheus/releases/download/v2.34.0/prometheus-2.34.0.linux-amd64.tar.gz
tar -xzf prometheus-2.34.0.linux-amd64.tar.gz
sudo mv prometheus-2.34.0.linux-amd64 /usr/local/prometheus
sudo useradd -rs /bin/false prometheus
sudo chown -R prometheus:prometheus /usr/local/prometheus
cd /usr/local/prometheus
sudo nano prometheus.yml

# global:
#   scrape_interval: 15s

# scrape_configs:
#  - job_name: 'prometheus'
#    static_configs:
#      - targets: ['localhost:9090']

cd /usr/local/prometheus
sudo -u prometheus ./prometheus --config.file=prometheus.yml
