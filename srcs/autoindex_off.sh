sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-enabled/localhost
service nginx restart
bash