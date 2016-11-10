FROM vutran/docker-nginx-php5-fpm

WORKDIR /var/www/html

RUN aptitude install -y signing-party

COPY *.php /var/www/html/
COPY *.sh /app/
COPY default /etc/nginx/sites-available

CMD cron && service php5-fpm start && nginx
