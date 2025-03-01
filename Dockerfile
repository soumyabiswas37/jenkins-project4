FROM soumyabiswas37/container_java_ssh_httpd:v2

COPY index.html /var/www/html/index.html

CMD ["/usr/sbin/httpd"]

EXPOSE 80