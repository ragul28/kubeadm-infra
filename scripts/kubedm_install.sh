#/bin/bash
# Get the latest release version https://kubernetes.io/releases/
# Latest=1.25.4
# Previous=1.24.8

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet=1.24.8-00 kubeadm=1.24.8-00 kubectl=1.24.8-00
sudo apt-mark hold kubelet kubeadm kubectl

sudo systemctl stop kubelet