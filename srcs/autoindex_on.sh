sed -i 's/autoindex off/autoindex on/g' /etc/nginx/sites-enabled/localhost
service nginx restart
bash