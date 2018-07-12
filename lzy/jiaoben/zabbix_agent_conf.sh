#!/bin/bash
ROOT=`dirname $0`
set -x
ufw allow from 10.161.238.151
ufw allow from 115.29.198.51


if [ -f /etc/lsb-release ]
        then
        apt-get update
        apt-get install zabbix-agent -y

        IP=`cat /tmp/ip.txt`
        scp -pr /etc/zabbix/zabbix_agentd.conf /tmp/zabbix_agentd.conf
        sed -i '/ServerActive=/d' /etc/zabbix/zabbix_agentd.conf
        sed -i '/Server=/d' /etc/zabbix/zabbix_agentd.conf
        sed -i '/Hostname=/d' /etc/zabbix/zabbix_agentd.conf
        echo "Server=zabbix.baibu.la" >> /etc/zabbix/zabbix_agentd.conf
        echo "ServerActive=zabbix.baibu.la" >> /etc/zabbix/zabbix_agentd.conf
        echo "Hostname=${IP}" >> /etc/zabbix/zabbix_agentd.conf
        tar xzvf ${ROOT}/zabbix.tgz -C /etc/
        /etc/init.d/zabbix-agent restart
else    
        ############# 判断非ubuntu系统,并安装zabbix-agent的服务  
        rpm -ivh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
        yum install -y zabbix-agent
        IP=`cat /tmp/ip.txt`
        scp -pr /etc/zabbix/zabbix_agentd.conf /tmp/zabbix_agentd.conf
        sed -i '/ServerActive=/d' /etc/zabbix/zabbix_agentd.conf
        sed -i '/Server=/d' /etc/zabbix/zabbix_agentd.conf
        sed -i '/Hostname=/d' /etc/zabbix/zabbix_agentd.conf
        echo "Server=zabbix.baibu.la" >> /etc/zabbix/zabbix_agentd.conf
        echo "ServerActive=zabbix.baibu.la" >> /etc/zabbix/zabbix_agentd.conf
        echo "Hostname=${IP}" >> /etc/zabbix/zabbix_agentd.conf
        systemctl enable zabbix-agent
        tar xzvf ${ROOT}/zabbix.tgz -C /etc/
        systemctl restart zabbix-agent
fi

