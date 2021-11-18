FROM nginxinc/nginx-unprivileged:1-alpine
#unprivileged container: a container that allows you to run NGINX in unprevileged mode

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./uwsgi_params /etc/nginx/uwsgi_params

USER root

RUN mkdir -p /vol/static
#755: Owner will have full access, everyone else is read-only
RUN chmod 755 /vol/static

USER nginx