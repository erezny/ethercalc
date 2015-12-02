#
# This image requires a linked redis Docker container:
#
#    docker run --name redis -d -v /docker/host/dir:/data redis redis-server --appendonly yes
#    docker run -d -p 8000:8000 --link redis:redis audreyt/ethercalc
#

FROM node:0.10

RUN useradd ethercalc --create-home
RUN npm install -g pm2

ADD / /home/ethercalc/application/
RUN chown -R ethercalc /home/ethercalc/application
WORKDIR /home/ethercalc/application
RUN npm install
RUN make depends

USER ethercalc
ENV HOME /home/ethercalc
EXPOSE 8000
CMD ["sh", "-c", "REDIS_HOST=$REDIS_PORT_6379_TCP_ADDR REDIS_PORT=$REDIS_PORT_6379_TCP_PORT node /home/ethercalc/application/bin/ethercalc"]
