#!/bin/bash
sudo apt update -y
sudo apt install -y python3-pip git
sudo apt install python3-flask -y
sudo apt install python3-flask-cors -y
git clone https://github.com/dkbera01/Toto3107-flaskp.git /home/ubuntu/app
bash -c "cd /home/ubuntu/app/backend && nohup python3 app.py > /home/ubuntu/flask.log 2>&1 &"
