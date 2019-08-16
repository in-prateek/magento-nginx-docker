FROM nginx:1.9

COPY etc/vhost.conf /etc/nginx/conf.d/default.conf
COPY etc/certs/ /etc/nginx/ssl/
COPY bin/* /usr/local/bin/

EXPOSE 80 443

ARG UPLOAD_MAX_FILESIZE
ENV UPLOAD_MAX_FILESIZE $UPLOAD_MAX_FILESIZE

ARG FPM_HOST
ENV FPM_HOST $FPM_HOST

ARG FPM_PORT
ENV FPM_PORT $FPM_PORT

ARG MAGENTO_ROOT
ENV MAGENTO_ROOT $MAGENTO_ROOT

ARG MAGENTO_RUN_MODE
ENV MAGENTO_RUN_MODE $MAGENTO_RUN_MODE

ARG DEBUG
ENV DEBUG $DEBUG

RUN ["chmod", "+x", "/usr/local/bin/docker-environment"]

ENTRYPOINT ["/usr/local/bin/docker-environment"]

CMD ["nginx", "-g", "daemon off;"]
