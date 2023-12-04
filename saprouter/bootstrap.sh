#!/bin/bash
sudo mkdir -p /opt/saprouter/
sudo wget https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouter -O /opt/saprouter/saprouter
sudo chmod +x /opt/saprouter/saprouter
sudo wget https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/niping -O /opt/saprouter/niping
sudo chmod +x /opt/saprouter/niping
sudo wget https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouter.service -O /etc/systemd/system/saprouter.service
sudo wget ${var.routtab-file-url} -O /opt/saprouter/saprouttab
sudo chown -R root:root /opt/saprouter/
sudo systemctl daemon-reload
sudo systemctl enable saprouter.service
sudo systemctl start saprouter.service