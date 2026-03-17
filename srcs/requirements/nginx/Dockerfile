FROM debian:bookworm


# Install nginx and openssl
RUN apt-get update && apt-get install -y nginx openssl

# Ensure nginx runs as www-data with correct UID
RUN usermod -u 33 www-data && groupmod -g 33 www-data

# Create SSL directory
RUN mkdir -p /etc/nginx/ssl

# Copy configuration files
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/ssl_keys_generator.sh /usr/local/bin/

# Set permissions
RUN chmod +x /usr/local/bin/*.sh

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/ssl_keys_generator.sh"]
