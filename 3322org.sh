#/bin/bash
username="你的账号"
password="你的密码"
hostname="填入你的动态域名"

current_ip=$(curl http://ip.sb -4)
saved_ip=$(cat ip.txt)
if [ "$current_ip" = "$saved_ip" ]; then
    echo "IP地址没有变化，脚本结束。"
    exit 0
else
    echo "$current_ip" > ip.txt
    curl -u "$username:$password" "http://members.3322.net/dyndns/update?hostname=$hostname"
    if [ $? -eq 0 ]; then
           echo "更新成功！"
    else
          echo "更新失败！"
    fi
fi
