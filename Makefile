
generate_ssl:
	@echo "Generating ssl keys..."
	openssl req -x509 -newkey rsa:4096 -keyout ./secrets/key.pem -out ./secrets/cert.pem -sha256 -days 3650 -nodes -subj "/C=ES/ST=Madrid/L=Madrid/O=Tfef/OU=Fundacion/CN=ggasset-.42.fr"
	@echo "ssl keys generated."

all:
	mkdir secrets
	make generate_ssl


.PHONY: all
