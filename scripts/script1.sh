#!/bin/bash

sudo apt update

sudo apt install apache2 -y

sudo ufw allow 'Apache'

sudo -i

sudo cat > /var/www/html/index.html <<'EOF'  
<h1> Hello User</h1>
  <p>
    Welcome to Webser VM
    
  </p>
EOF

# iptables -A INPUT -i eth0 -p tcp -m tcp --dport 3306 -j ACCEPT
# sudo netstat -anltp|grep :3306
# sudo ssh -fNg -L 3307:127.0.0.1:3306 azurevmuser@servername