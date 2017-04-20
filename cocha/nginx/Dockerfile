FROM nginx:alpine

# Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Delete sym links in var/log/nginx
RUN rm /var/log/nginx/access.log && \
    rm /var/log/nginx/error.log

# Install filebeat
ADD filebeat-5.3.0-linux-x86_64.tar.gz /

# Filebeat config
COPY filebeat.yml /etc/filebeat/filebeat.yml

# Copy docker-cmd
COPY docker-cmd.sh /docker-cmd.sh

CMD /docker-cmd.sh