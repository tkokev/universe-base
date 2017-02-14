#replace line #1 of https://github.com/tkokev/universe/blob/version-3.x/docker/local-universe/Dockerfile.base with this
# container name tkokev/universe-base
FROM registry:2.4.1

ENV NGINX_VERSION 1.10.3-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
  && echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install --no-install-recommends --no-install-suggests -y \
            ca-certificates \
            nginx=${NGINX_VERSION} \
            nginx-module-xslt \
            nginx-module-geoip \
            nginx-module-image-filter \
            nginx-module-perl \
            nginx-module-njs \
            gettext-base \
  && rm -rf /var/lib/apt/lists/*

#comment out all below and let universe Dockerfile.base still do it
# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#  && ln -sf /dev/stderr /var/log/nginx/error.log

#COPY certs /certs
#COPY certs/domain.crt /usr/share/nginx/html/certs/domain.crt

#COPY registry-config.yml /etc/docker/registry/config.yml
#COPY default.conf /etc/nginx/conf.d/default.conf

#EXPOSE 80 443 5000

#ENTRYPOINT []
