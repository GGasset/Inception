FROM debian:stable

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get -y install sudo
RUN sudo apt-get -y install curl

RUN sudo apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring

RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

RUN mkdir /root/.gnupg
RUN chmod 777 /root/.gnupg
RUN gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
https://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list


RUN sudo apt update -y
RUN sudo apt install -y nginx

RUN sudo apt install -y openssl

COPY ./conf/nginx.conf /etc/nginx/


ENTRYPOINT [ "nginx", "--with-http_ssl_module" ]

