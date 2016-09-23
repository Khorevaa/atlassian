FROM nginx:1.10.1

ENV NGINX_HOME_DIR "/home/nginx"
ENV CONF_TEMPLATE_NAME "nginx.conf.template"
ENV CUSTOM_NGINX_HOST nginx
ENV CUSTOM_NGINX_PORT 80

RUN mkdir -p ${NGINX_HOME_DIR}

COPY "nginx.conf.template" "${NGINX_HOME_DIR}"

RUN cat "${NGINX_HOME_DIR}/${CONF_TEMPLATE_NAME}" > /etc/nginx/conf.d/default.conf
