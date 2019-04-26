#!/bin/bash
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
apt install -y docker.io
systemctl start kubelet
host=`ip addr show eth0 | grep -w inet|awk '{print substr($2,0,length($2)-3)}' | head -1`
sudo sed -i "/KUBELET_CONFIG_ARGS=/a Environment=\"KUBELET_EXTRA_ARGS=--node-ip=$host\"" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf





