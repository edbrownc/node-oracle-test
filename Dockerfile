FROM node:10

WORKDIR /home/node/app

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get install -y alien libaio1
RUN wget http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.3-basiclite-19.3.0.0.0-1.x86_64.rpm
RUN alien -i --scripts oracle-instantclient*.rpm
RUN rm -f oracle-instantclient19.3*.rpm && apt-get -y autoremove && apt-get -y clean

## RUN adduser --force-badname 1001

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

RUN chgrp -R 0 /home/node/app && \
    chmod -R g=u /home/node/app

##COPY --chown=node:node . .

USER node