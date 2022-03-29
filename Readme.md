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

# 6. Cronjob

crontab -e

0 */2 *   *   *    /bin/bash etcd-backup.sh

# 7. Kubernetes secret to access images from private account

kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=manjitsinghyadav --docker-password=XXXXXXXX --docker-email=XXXXXXXXX@gmail.com
