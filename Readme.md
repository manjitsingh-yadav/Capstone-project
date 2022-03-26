mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

# 3. Install networking solution (Weave)

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# 4. Generate token 

kubeadm token create --print-join-command --ttl 0

# 5. Load testing

apt-get update

apt-get install -y apache2-utils

ab -n 100000 -c 500 http://<service-ip-cluster-ip>:port/
