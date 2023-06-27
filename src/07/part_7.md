# Prometheus

## Install
#
### - sudo apt install prometheus
### - download https://github.com/prometheus/prometheus/releases/download/v2.45.0/prometheus-2.45.0.linux-arm64.tar.gz
### - tar xvf ~/prometheus-2.45.0.linux-amd64.tar.gz
### - sudo cp ~/prometheus-2.45.0.linux-amd64/prometheus /usr/local/bin
### - sudo cp ~/prometheus-2.45.0.linux-amd64/promtool /usr/local/bin
### - sudo cp -r ~/prometheus-2.45.0.linux-amd64/consoles /etc/prometheus
### - sudo cp -r ~/prometheus-2.45.0.linux-amd64/console_libraries /etc/prometheus
### - sudo systemctl edit --full --force prometheus.service


# Grafana
#
## Install
#
### - wget https://dl.grafana.com/oss/release/grafana_9.2.4_amd64.deb
### sudo dpkg -i grafana_9.2.4_amd64.deb && \
### sudo systemctl enable grafana-server && sudo systemctl start grafana-server