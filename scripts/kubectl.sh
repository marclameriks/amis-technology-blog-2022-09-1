#!/bin/bash
echo "**** Begin installing kubectl"

#Install kubectl binary 
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

#Check the kubectl configuration
kubectl cluster-info

echo "**** End installing kubectl"

echo "**** Begin preparing dashboard"

kubectl proxy --address='0.0.0.0' </dev/null &>/dev/null &

echo "**** End preparing dashboard"

#Install socat
sudo apt-get install socat

echo "**** Determine the IP of the minikube node"
nodeIP=$(kubectl get node minikube -o yaml | grep address: | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
echo "---$nodeIP---"

echo "**** Via socat forward local port 8080 to port 8080 on the minikube node ($nodeIP)"
socat tcp-listen:8080,fork tcp:$nodeIP:8080 &