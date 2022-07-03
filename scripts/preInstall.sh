#set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./conf;

#create account
apt-get install apache2-utils -y
touch ./conf/passwords;
echo $APP_PASSWORD | htpasswd -c -i ./conf/passwords root

#generate squid.conf
cat << EOT > ./conf/squid.conf
http_port 3128

acl SSL_ports port 1-65535
acl Safe_ports port 1-65535

cache_log /dev/null
cache_mem 2048 MB
access_log none

auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_access deny all

EOT