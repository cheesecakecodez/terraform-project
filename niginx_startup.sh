!#/bin/bash
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>This is Nginx</h1>"
