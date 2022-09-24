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

# storage map code
# ssh -t azureuser@$APPSERVERIP \
#     "mkdir azureshare; \
#     sudo mount -t cifs //$STORAGEACCT.file.core.windows.net/erp-data-share azureshare \
#     -o vers=3.0,username=$STORAGEACCT,password=$STORAGEKEY,dir_mode=0777,file_mode=0777,sec=ntlmssp; findmnt \
#     -t cifs; exit; bash"

