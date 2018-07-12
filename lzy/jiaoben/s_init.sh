#S_INIT(){
#################   base package install ######################
if [ -f /etc/centos-release ]
	then
	yum -y update
	yum install -y wget
	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup-`date +%s`
	mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.backup-`date +%s`
	mv /etc/yum.repos.d/epel-testing.repo /etc/yum.repos.d/epel-testing.repo.backup-`date +%s`
	wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
	wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
	sed -i '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/*
	yum makecache
	yum -y update
	yum install -y vim gcc make cmake build-essential lrzsz dos2unix rcconf nmap iftop iotop unzip
	yum install -y  libdevmapper*
#	yum remove -y docker docker-common docker-selinux docker-engine
        yum install -y yum-utils device-mapper-persistent-data lvm2
#	yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=0
EOF
	yum update -y
#	yum install -y docker-ce-17.09.1.ce-1.el7.centos
	yum install -y salt-minion
	yum install -y ufw
####	安装docker与kubernetes的服务	
#	yum install -y docker kubelet kubeadm kubectl kubernetes-cni
	yum install -y docker
	systemctl enable docker
#	systemctl start docker
#	systemctl enable kubelet
#	cat > /etc/systemd/system/kubelet.service.d/20-pod-infra-image.conf <<EOF
#[Service]
#Environment="KUBELET_EXTRA_ARGS=--pod-infra-container-image=registry.cn-hangzhou.aliyuncs.com/centos-bz/pause-amd64:3.0"
#EOF
#	systemctl daemon-reload
#	systemctl restart kubelet
	
####################



	
	##########  修改最大文件打开数
	scp -pr /etc/systemd/system.conf /tmp/system.conf-`date +%s`
	sed -i 's/\#DefaultLimitNOFILE\=/DefaultLimitNOFILE\=1024000/g;s/\#DefaultLimitNPROC\=/DefaultLimitNPROC\=1024000/g' /etc/systemd/system.conf

	grep SELINUX=enforcing /etc/selinux/config
	[ $? = 0 ] && cp -a /etc/selinux/config /tmp/config-`date +%s` && sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
	cp -a /etc/ssh/sshd_config /tmp/sshd_config-`date +%s`
	sed -i 's/\#PermitRootLogin\ yes/PermitRootLogin\ no/g;s/\#PubkeyAuthentication\ yes/PubkeyAuthentication\ yes/g;s/PasswordAuthentication\ yes/PasswordAuthentication\ no/g' /etc/ssh/sshd_config
	systemctl restart sshd.service
	########### 安装ntpd时间服务器,华为云服务器未有安装该服务
	ps -ef|grep ntpd|grep -v grep
	[ $? -ne 0 ] && yum install -y ntp && systemctl enable ntpd && systemctl start ntpd
	
else
	rm /bin/sh -rf
	ln -s /bin/bash /bin/sh
	cp -a /etc/apt/sources.list /etc/apt/sources.list_bak
	sed -i '/mirrors.aliyun.com/d' /etc/apt/sources.list
	sed -i '/aliyun.com/d' /etc/apt/apt.conf
	dpkg --configure -a
	apt-get update
	apt-get install -y vim gcc make cmake build-essential lrzsz dos2unix rcconf nmap iftop iotop unzip
	apt-get update -y
	apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
	apt-get install -y apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
	apt-key fingerprint 0EBFCD88
	dd-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	pt-get update -y
	pt-get install -y docker-ce
	apt-get install -y salt-minion
	cp -a /etc/ssh/sshd_config /tmp/sshd_config-`date +%s`
	sed -i 's/PermitRootLogin\ yes/PermitRootLogin\ no/g' /etc/ssh/sshd_config
	systemctl restart sshd.service
fi
sleep 1
#################   end  #####################

######## salt-minion configure  ##############
IP=`cat /tmp/ip.txt`
echo 'master: 115.29.198.51' > /etc/salt/minion
echo "id: $IP" >> /etc/salt/minion
#/etc/init.d/salt-minion restart
sleep 1
######## end  ##############

#######################  disk partition  ################
##df -h | grep xvdb1 
df -h | grep vdb1 
if [ $? != 0 ]
	then
#fdisk  /dev/xvdb << EOF
	fdisk -l|grep xvdb
	if [ $? = 0 ]
		then
fdisk  /dev/xvdb << EOF
n
p
1


wq
EOF

sleep 2
                mkfs.ext4 /dev/xvdb1
                cp /etc/fstab /tmp/fstab
                mkdir /data
                echo '/dev/xvdb1  /data ext4    defaults    0  0' >> /etc/fstab
                mount -a
	else
fdisk  /dev/vdb << EOF
n
p
1


wq
EOF

sleep 2
		#mkfs.ext4 /dev/xvdb1
		mkfs.ext4 /dev/vdb1
		cp /etc/fstab /tmp/fstab
		mkdir /data
		#echo '/dev/xvdb1  /data ext4    defaults    0  0' >> /etc/fstab
		echo '/dev/vdb1  /data ext4    defaults    0  0' >> /etc/fstab
		mount -a
	fi
fi
sleep 1
#fdisk  /dev/vdb << EOF
#n
#p
#1
# 
# 
#wq
#EOF
#
#sleep 20
##mkfs.ext4 /dev/xvdb1
#mkfs.ext4 /dev/vdb1
#
#cp /etc/fstab /tmp/fstab
#mkdir /data
##echo '/dev/xvdb1  /data ext4    defaults    0  0' >> /etc/fstab
#echo '/dev/vdb1  /data ext4    defaults    0  0' >> /etc/fstab
#mount -a
######################  end   #############################


################### create apps directories ###############
mkdir /data/ci/war -p
mkdir /data/ci/update -p
mkdir /data/ci/bak -p
mkdir /data/ci/docker -p
mkdir /data/backup -p
mkdir /data/server -p
mkdir /data/software -p
mkdir -p /data/logs/nexus
mkdir -p /data/logs/redis
mkdir -p /data/logs/jenkins
mkdir -p /data/logs/mongodb
mkdir -p /data/logs/elk
mkdir -p /data/logs/elasticsearch
mkdir -p /data/logs/zookeeper
mkdir -p /data/logs/resin
mkdir -p /data/logs/git
mkdir -p /data/logs/zabbix
mkdir -p /data/logs/nginx
mkdir -p /data/logs/mysql
mkdir -p /data/logs/php
mkdir -p /data/logs/dubbo
mkdir -p /data/logs/tomcat
mkdir -p /data/logs/apache
mkdir -p /data/logs/redmine
mkdir -p /data/logs/java
mkdir  -p /data/jdk
mkdir -p /data/tmp 

chown zhjkj.zhjkj /data/jdk -R
chown zhjkj.zhjkj /data/ci -R
chown zhjkj.zhjkj /data/server -R


chown zhjkj.zhjkj /data/logs -R
chmod 777 /data/logs -R
chmod 777 /data/tmp -R
chmod 777 /data/backup -R
####################### end #######################


#################  /etc/sudoers文件修改   ####################
cp -a /etc/sudoers /tmp/sudoers-`date +%Y-%m-%d-%H-%M-%S`
sed -i '/\%admin/d' /etc/sudoers
echo '%admin ALL=(ALL) NOPASSWD:NOPASSWD:ALL' >> /etc/sudoers
####################### end #######################
 

############## 生成日志分割配置 ##################
cat >> /etc/logrotate.d/baibu << EOF
/data/logs/java/*.log
/data/logs/redmine/*.log
/data/logs/apache/*.log
/data/logs/dubbo/*.log
/data/logs/zabbix/*.log
/data/logs/git/*.log
/data/logs/zookeeper/*.log
/data/logs/elasticsearch/*.log
/data/logs/mongodb/*.log
/data/logs/jenkins/*.log
/data/logs/redis/*.log
/data/logs/nexus/*.log
/data/logs/elk/*.log  
/data/logs/php/*.log  
/data/logs/nginx/*.log  
/data/logs/mysql/*.log  
/data/logs/tomcat/*.log  
/data/logs/resin/*.log  
{
	su root root
        size 100M
        create
        start 1
        rotate 5
        compress
        delaycompress
        copytruncate
}
EOF
sleep 1
#}
########################### end #########################


###########  add swap  ###########
SIZE=`free -m|grep Swap|awk '{print $2}'`
if [ $SIZE = 0 ]
then
	fallocate -l 4G /mnt/swap
	mkswap /mnt/swap
	grep -q swap /etc/fstab
	[ $? -ne 0 ] && scp -pr /etc/fstab /tmp/fstab_bak;echo "/mnt/swap none swap sw 0 0" >> /etc/fstab;swapon /mnt/swap
fi
sleep 1
################# end ###############

##########  add firewall  ########

echo 'export HISTTIMEFORMAT="%F %T `whoami` "' >> /etc/profile

############## change docker  ####################
service docker stop
mkdir -p /data/docker
scp -cp /var/lib/docker/* /data/docker/
chmod 777 -R /data/docker
mv /var/lib/docker /var/lib/docker-`date +%s`
gpasswd -a zhjkj docker
ln -s /data/docker /var/lib/docker
systemctl enable docker
#systemctl start docker
sleep 1
#################   end  ###################
########### some services enable #############
systemctl enable salt-minion
systemctl enable ufw
sleep 2

############  开启ufw防火墙管理程序，以及关闭默认的ssh端口 ##############
ufw enable << EOF
y
EOF
sleep 1
ufw allow from 10.161.238.151
ufw allow from 115.29.198.51
ufw allow from 10.161.235.59
ufw allow from 114.215.208.75
ufw allow from 10.45.166.157
ufw allow from 120.76.121.184
ufw allow from 121.41.96.106
ufw allow from 10.117.184.76
ufw allow from 118.31.64.2
ufw allow from 118.31.65.173
ufw allow from 120.78.12.10
ufw allow from 120.78.15.135
ufw allow from 10.80.235.70
ufw allow from 10.80.235.221
if [ -f /etc/centos-release ]
	then
	ufw delete allow SSH
	else
	ufw delete allow 22/tcp
fi

############ 安装nfs及配置nfs共享目录 ，方便日志的集中查看
#sh /tmp/nfs.sh

############   安装zabbix的监控
/bin/sh /tmp/zabbix_agent_conf.sh

#[ -f /etc/centos-release ] && reboot
sleep 2
reboot
