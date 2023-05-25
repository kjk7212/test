setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/' /etc/selinux/config

swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

cat <<EOF>> /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF>> /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

hostnamectl set-hostname k8s-master1

#Host name 변경 필요
cat <<EOF >> /etc/hosts
172.16.210.26 k8s-master1
172.16.210.27 k8s-worker1
172.16.210.29 k8s-master2
172.16.210.30 k8s-worker2
EOF

yum update -y

yum install yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install containerd.io -y
sudo systemctl daemon-reload
sudo systemctl enable --now containerd

sed -i '/"cri"/ s/^/#/' /etc/containerd/config.toml

 systemctl restart containerd

sudo bash -c 'cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF'

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

sudo systemctl enable kubelet && sudo systemctl start kubelet


#Master Node

#sudo firewall-cmd --permanent --add-port=6443/tcp && sudo firewall-cmd --permanent --add-port=10250/tcp && sudo firewall-cmd --reload
#systemctl enable firewalld

#sudo kubeadm config images pull
#sudo kubeadm init --pod-network-cidr=10.244.0.0/16

#mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Worker Node
kubeadm join 172.16.210.26:6443 —token sp90h3.txi801g0kvevg01o \
	—discovery-token-ca-cert-hash sha256:0592a973bb6d058e43a0972caa83b7973dd22d606e7e3ef896535355d1043c00
