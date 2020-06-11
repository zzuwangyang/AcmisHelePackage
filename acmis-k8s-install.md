echo "192.168.101.121 k8s.master" >> /etc/hosts
ping  k8s.master
hostnamectl set-hostname k8s.master
ssh-keygen
ssh-copy-id k8s.master
ssh k8s.master

http://mirrors.aliyun.com/repo/Centos-7.repo
/etc/yum.repos.d/CentOS-Base.repo
yum clean all
yum makecache
 yum install vim bash-completion net-tools gcc -y
 
 yum install -y yum-utils device-mapper-persistent-data lvm2
 
 yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
 
 yum -y install docker-ce
 
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
   "registry-mirrors": ["https://fl791z1h.mirror.aliyuncs.com"]
}
EOF
 
 systemctl daemon-reload
 systemctl restart docker
 
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
 
yum  -y install kubectl kubelet kubeadm
systemctl enable kubelet
 
systemctl  stop firewalld  &&  systemctl  disable firewalld
yum -y install iptables-services  &&  systemctl  start iptables  &&  systemctl  enable iptables&&  iptables -F  &&  service iptables save
 
swapoff -a && sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
setenforce 0 && sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
 
cat > kubernetes.conf <<EOF
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-ip6tables=1
net.ipv4.ip_forward=1
net.ipv4.tcp_tw_recycle=0
vm.swappiness=0 # 禁止使用 swap 空间，只有当系统 OOM 时才允许使用它
vm.overcommit_memory=1 # 不检查物理内存是否够用
vm.panic_on_oom=0 # 开启 OOM
fs.inotify.max_user_instances=8192
fs.inotify.max_user_watches=1048576
fs.file-max=52706963fs.nr_open=52706963
net.ipv6.conf.all.disable_ipv6=1
net.netfilter.nf_conntrack_max=2310720
EOF

cp kubernetes.conf  /etc/sysctl.d/kubernetes.conf
sysctl -p /etc/sysctl.d/kubernetes.conf

systemctl enable docker.service
 

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

yum -y  install  kubeadm-1.18.0 kubectl-1.18.0 kubelet-1.18.0
systemctl enable kubelet.service

docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock  registry.cn-hangzhou.aliyuncs.com/geekcloud/image-pull:k8s-v1.18.3
kubeadm config images pull
kubeadm init --kubernetes-version=1.18.0  \
--apiserver-advertise-address=192.168.101.121   \
--image-repository registry.aliyuncs.com/google_containers  \
--service-cidr=10.10.0.0/16 --pod-network-cidr=10.122.0.0/16

mkdir -p $HOME/.kube
sudo cp -rf /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config



(iptables failed: iptables --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 8001 -j DNAT --to-destination 172.17.0.2:443 ! -i docker0: iptables: No chain/target/match by that name.
systemctl restart docker

docker run -d --restart=unless-stopped -p 80:80 -p 443:443 -v /var/rancher:/var/lib/rancher/ rancher/rancher:stable


sudo yum install yum-utils
vim /etc/yum.repos.d/nginx.repo
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

sudo yum-config-manager --enable nginx-mainline