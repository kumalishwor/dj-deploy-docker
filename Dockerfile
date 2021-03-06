FROM python:3.8-alpine

# This will add scripts to the path of the running container
ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt
# Required Alpine packages to install uWSGI
# gcc,libc-dev,linux-headers are for installing requirements.txt
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers
RUN pip install -r /requirements.txt
# This will remove the virtual setup requirements that we have created above
RUN apk del .tmp

RUN mkdir /app
COPY ./app /app
WORKDIR /app
COPY ./scripts /scripts


RUN chmod +x /scripts/*

# Creates two directories inside Docker image
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/

# This will create a new user in the docker image
RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user

CMD ["entrypoint.sh"]
