FROM ubuntu:16.04

WORKDIR /opt

ADD nodejs_installer /tmp/nodejs_installer
RUN chmod +x /tmp/nodejs_installer
RUN bash /tmp/nodejs_installer

RUN mkdir -p /project

RUN apt-get update &&\
    apt-get install -y build-essential && \
    apt-get install -y nodejs && \
    /usr/bin/npm install -g gulp && \
    npm install gulp gulp-minify-css gulp-rename

VOLUME ["/opt"]
VOLUME ["/project"]

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY gulpfile.js .

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
