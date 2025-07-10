#!/bin/bash
exec > >(tee /home/ubuntu/express_debug.log | logger -t user-data -s 2>/dev/console) 2>&1

echo "=== SCRIPT START ==="
echo "Flask private IP is: ${flask_public_ip}"
sudo apt update -y
sudo apt install -y nodejs npm git
git clone https://github.com/dkbera01/Toto3107-flaskp.git /home/ubuntu/app
bash -c "cd /home/ubuntu/app/frontend && sudo npm install"
bash -c "cd /home/ubuntu/app/frontend && sudo sed -i \"s|http://backend:5000|http://${flask_public_ip}:5000|g\" app.js"
bash -c "cd /home/ubuntu/app/frontend && nohup node app.js > /home/ubuntu/express.log 2>&1 &"
