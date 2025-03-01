FROM soumyabiswas37/container_java_ssh_httpd:v2

RUN mkdir /var/www/html

COPY index.html /var/www/html/index.html

CMD ["httpd","-D","foreground"]

EXPOSE 80