#!/bin/sh
set -x


#USER_ADD(){
groupadd -g 1000 zhjkj
useradd -d /home/zhjkj -g zhjkj -u 1000 -m -s /bin/bash zhjkj

mkdir -p /home/zhjkj/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+kPJTYToMo+slXGf1irkfEkcp3rQA5AAqIoROqkz/HoJRyQc1YMPTTk7iLguJyASqVPjOQkw/36S5eOIPG00G4ZRFgcyWUjyv8gVyCfj9VovSgHg8Fzsw9BYgJvy2ewqTuNQQ88o5UUcTGBByXke5hXKrDE76+QBLhSUBuK8hzJq8k7JSs6TjguIrov8YxLw+/9I/JMnovIa9EQfKqM3g7uSGX+JxBehqA2ggyJA9JoPfzILOl5eu5jE27VTJLATiQpa0eNIbmNDIFC+7oGmlpnFMze/Y5Q/KqDb9UtwkYgAofTVpauQwCywXnJw8SgFXha9WhqUgZ1CGPLQUtZwL root@ubuntu' >/home/zhjkj/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCs7rH1KsslEclGHr2d8M63bFRYyLxyeEL/Jv3VOOQbbYQ76ZrsTldM2TNsewrzR236i/WnpmP0CgX93FmnpjTyF1qDhPP0NDhxPn+q8ofWYiz2P9pVPC2p7iX6Mcg7trffdnja0EChKKXEzK+ewT7Kd8c6jII+zPS6Pp1gSqpS2pERdLCsaix4tCaPgrHHKzDNpska4kzljMjxztL0Yrg16NFP/6EnEC5pJi5eCtr7ctr94xuiLXdqjWqVVaQqloUc1wo12BxMfhmpAMrhO9yXYTJ8QUEuzZxUR2cahBsiLg9TLgi268u5QNhV5oo0WVLJOsISVB0evxEyzVzy9f9X yangminghui@ubuntu' >>/home/zhjkj/.ssh/authorized_keys
echo 'ssh-dss AAAAB3NzaC1kc3MAAACBAMr5zF47EWsyzlB52XKld5oFt4LibMZPkVT/mp6EpGJA4oHSRYvCGSkPtPwZxXtjKu3IbobylG9D39br0+ppeTqe8dXtOmNysNmOQ8JBLtsurKqR+xFNlAWk76ymZ5Msuhb3DPchf5q4QacVuX39UPHQAqLWhXkZNLKMHLJYz6FnAAAAFQD1r8oiGqEpMT9emcgxs4vQGXONxwAAAIASUZV3eD1RKwqMfkYKwTRyFl0wn9iiiLIyyw4e8XF7WGIDu0TUsGvJEDl0yjbSrTvEbvh/L5dTCSb/90h6U13UWMzM0mVrSHoeu0F6QM9XCaQSxN+N4yRC+Awp9c41Q+WJpS2GhYvUS8mUaE3fmHwyJCYjeMIBJEYU8dyhsOQSVgAAAIAq+kyIjDc0XR5GqaUDbibJ5nQ7xBe9Q+dl/Y5CCM97AKb4958892YlwlRjijoFO4TZ4lJ9PsIgZXZYA/9ExQPLNID3DQ5DJwWYgTSM3Hn7wplzM21I8wByK32TFBn5M6dOMVn/vK8bFJ2zzmqZGORgO7xIZuhNKmO96CDHtu0HKA== zhjkj@localhost.localdomain' >>/home/zhjkj/.ssh/authorized_keys

echo 'ssh-dss AAAAB3NzaC1kc3MAAACBAJhRy26pkARTxK4iFr8FOuaAD2VKM52vT3Yx9gC/RVBBbZXPN7uMY4ILPAnWB84Y9fkGZ0OM7tFrcOAVRPWfsgXSTONqSh+AoN53tP8Z57f8Wi3GxX8P/+v5eRESJQboMrvXq8CJXx0R+gHDqvCMKzmFKLt/mxIbW2ZOo/ThX2H3AAAAFQDd7NC0Y6Y0I2buqztt7J2pEGcO9QAAAIEAjmGlm7v26vfjkHHJOWFWNik7WBniydFVsA5QTsSVjFq6NkBUkzsUOW4BNBap9zAX7HAEcNdlGNDxrqDykTBgt29m3x+siRlu/TkxJ0JiKElocI3rLJ+QPuVesmVIzplfkqtiKHMfmi2Uz7VpsTN0tV9BmIIDRbhKPt2kg1okznsAAACBAJXDUKkZ83KCm57AHMwVP+htOwSCOuxDVHUWk/KceUdvxwtc2TPi+0e8jKtSV7bJ3wQWgVNMVTbUimxK21LNKaeIc5rESVrUC8ZCGr8VEv5xOwzVO21C8zlAApJEWpeejWtUiDnbocmh5VXxnQni3avNtxuw3fGV9CaL5cCr/DN1 root@lzycentos' >>/home/zhjkj/.ssh/authorized_keys

chown zhjkj.zhjkj /home/zhjkj/.ssh -R
chmod 700 /home/zhjkj/.ssh
chmod 600 /home/zhjkj/.ssh/authorized_keys

groupadd -g 3000 admin

useradd -d /home/yangminghui -g admin -u 3001 -m -s /bin/bash yangminghui
useradd -d /home/tangjun -g admin -u 3002 -m -s /bin/bash tangjun
useradd -d /home/lizhaoyi -g admin -u 3034  -m -s /bin/bash lizhaoyi

mkdir -p /home/yangminghui/.ssh/ -p
echo 'ssh-dss AAAAB3NzaC1kc3MAAACBAJl7h1LuUZCn9lqvpM2oF0D8o/orjAyq4Og4ybL6ahdTWrFwvXLFMyn2l+U/W4bG+YZorXmSDoEuoTK/+03iZdQhrAWRQvTfK3tZWLF2NUZROAyT2d8hKuo5srdYtqW38Y58zR33zzKfysitURV/42GWLLkpkWQN9MTrpQ4OfqZLAAAAFQDeMr6JBLiM6r6AvvnV6pqW2egAMwAAAIBtcGHYFGr68ztv6Uo3T0Is/VOvprShTCIN6ByJ3bDD1HlPsc5KjrVHjg5axI8y6xwUO0o/V+Zw7b50JezegfvX29BH1NkaKDZERb5gN/A7hGCAbHfs2AQCFMUXACtpLSIMyQPeysoOs20ihCX31ArsWoVqF9YPRWKqCei/FWUwugAAAIB1BPEUySAuqblJtQG12NpBB+rbtm2MM7r0m5LFx8z5vC7jSqYrQFv4xbrtkbCRbXNJhqzh3+7Q8DhugguCLCiMd7scVN3X+vbYfe/O9vOXJ9vaZezIay+KEeKiZphsYQKL4qQzXkyZx5IzesSy+P9zYn+p8wYtS1BLiwemgzyMcw== root@rise-rs-173.rise.wx.yygamedev.com' > /home/yangminghui/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDpS1hGOulPvpkF6JRQGXKvUJ0EvmATTwnvD7d56Q6WZ1gktHbArg7tJ3OlZvSII5JcgrsEQHhSYj+JYQdI7ekJprjxNlNnn27iClTigwNUZeZhx5FHbHwTMInKP4Cc2QIo36pWUdx7lkg6vDDR6tWVfTh1jTJsdD5oUfk59/3lL3wZZYHQJRbb02T77rAG2nzwMv7AvD9mvgug5w8tfsT+LdBUSLJ6u7HPcD3mdEg1gT0TsjocE544g+6J9a+MTLQHFi5zyUGN7kwnkszMtr34DVpNBlTOjfrDaeklT9Hc8hQTO5vYkF+Up9civMzivGr30wxLdsYzEOQGZf9aH6Z root@ubuntu' >> /home/yangminghui/.ssh/authorized_keys
chown yangminghui.admin  /home/yangminghui/.ssh -R
chmod 700 /home/yangminghui/.ssh
chmod 600 /home/yangminghui/.ssh/authorized_keys


mkdir -p /home/tangjun/.ssh/ -p
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCbz+aLA0QymhahN0EpT9SszQvB789q23Xn+wEHTQoBgfkYTccdpRf8/5PBZ2aMRfzvJESr0PJIdUbA1oPFzjzE8k1APIamhhpMcEwtv9De1T+5ppx2JiF7cfZPnY1xbTKIUAaCwAe9uCWXjUwwfdG5t+8eXja/rsH7f1zWuK3gceeNcai+PkGfslegsT02c7IEkAcf7R68JEFlvQJ/1dvko3CR9hauWgIlq3DXt8JKZfdQ4Tazv3MKVOjSX3daCgWrrcus8j6SaAmQo50PcYapUfqGYVZeEddN3Wmt8iru/lUQ08YMQGRlu3qZMEOGWqgahSAKm7LsKwcS70eTMS47xypbSapj4wFlnpq/959E5uAaWcQ87QujsiqA7tRezlpo8tB8c7ies7ZTlEvjrW3amjUGftnR1X0LVUpdx7/lYyVr1Z5g9OWUBYM7tpu7SidZkM7e0RrFGZhpzKa6ROIuHrJOXN7Kte6O34lHHzkeObYddOdTXyf68MHT1imngEyzGDfsPrpuY1M7vyQdW/Rr8qOmFRQrZno7dmLNgJz1JB/dq/TVfeKIIJYQMCl4S1jVtiwoOOmB3YiG1Z4uO9+2a9Ni3xWUIN+MLXj2z1Pg4nXYcV3NhTmJbhgb9YVaQxDtu/Nlqs8ZNrfaqq4X0bgtRRA5/IImPrJp0Dhzr+Ja0Q== tangjun@tangjundeMacBook.local' > /home/tangjun/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDc5BVSJ+IOOMb3mbEYrX8uydN1G854b4Btq7MZc8BnoqjAc/S3M/2oAxikm2q6wjW0ZVsbE1yt3uwyubS4H8EL6tKi2t1jMf83R+WpPGEt++mn6m7qm7msThday+Qw2vZfBuqE8zVHWgL1cSkqJzmEA8V4RSgrV0SqfgIOrfp3HLsPTvAJdtYQbq15SjPqLq9OyFCQ70mloCXFmPQeRQALVSuKY+25FyWnNUK+lztTCGQ/f+spj8TMWifRV0jlW6gKnk95uweBP12NLZZOgU2ANXi8c4BxFnLL9UXlKEWTfYzujJ4kAp7FKPUGwdilTQXWXEVjkp4/ah3Gd2oEdpFH tangjun@salt-master-159' >> /home/tangjun/.ssh/authorized_keys
chown tangjun.admin  /home/tangjun/.ssh -R
chmod 700 /home/tangjun/.ssh
chmod 600 /home/tangjun/.ssh/authorized_keys

mkdir -p /home/lizhaoyi/.ssh/ -p
echo 'ssh-dss AAAAB3NzaC1kc3MAAACBAJhRy26pkARTxK4iFr8FOuaAD2VKM52vT3Yx9gC/RVBBbZXPN7uMY4ILPAnWB84Y9fkGZ0OM7tFrcOAVRPWfsgXSTONqSh+AoN53tP8Z57f8Wi3GxX8P/+v5eRESJQboMrvXq8CJXx0R+gHDqvCMKzmFKLt/mxIbW2ZOo/ThX2H3AAAAFQDd7NC0Y6Y0I2buqztt7J2pEGcO9QAAAIEAjmGlm7v26vfjkHHJOWFWNik7WBniydFVsA5QTsSVjFq6NkBUkzsUOW4BNBap9zAX7HAEcNdlGNDxrqDykTBgt29m3x+siRlu/TkxJ0JiKElocI3rLJ+QPuVesmVIzplfkqtiKHMfmi2Uz7VpsTN0tV9BmIIDRbhKPt2kg1okznsAAACBAJXDUKkZ83KCm57AHMwVP+htOwSCOuxDVHUWk/KceUdvxwtc2TPi+0e8jKtSV7bJ3wQWgVNMVTbUimxK21LNKaeIc5rESVrUC8ZCGr8VEv5xOwzVO21C8zlAApJEWpeejWtUiDnbocmh5VXxnQni3avNtxuw3fGV9CaL5cCr/DN1 root@lzycentos' >>/home/lizhaoyi/.ssh/authorized_keys
chown lizhaoyi.admin  /home/lizhaoyi/.ssh -R
chmod 700 /home/lizhaoyi/.ssh
chmod 600 /home/lizhaoyi/.ssh/authorized_keys
#}
