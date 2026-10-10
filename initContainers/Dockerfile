# FROM mysql:8.0
# ENV MYSQL_ROOT_PASSWORD="RoboShop@1"
# COPY *.sql /docker-entrypoint-initdb.d

FROM mysql:8.0
COPY db/ /docker-entrypoint-initdb.d
COPY custom-script.sh /usr/local/bin/custom-script.sh
RUN chmod +x /usr/local/bin/custom-script.sh
ENTRYPOINT ["/usr/local/bin/custom-script.sh"]
