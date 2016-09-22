FROM nginx:1.10.1

ENV NGINX_HOME_DIR "/home/nginx"
ENV CUSTOM_NGINX_HOST nginx
ENV CUSTOM_NGINX_PORT 80

RUN mkdir -p ${NGINX_HOME_DIR}

COPY "nginx.conf.template" "${NGINX_HOME_DIR}"

CMD ["envsubst '$$CUSTOM_NGINX_HOST $$CUSTOM_NGINX_PORT' < /home/nginx/nginx.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
