FROM ubuntu:22.04

RUN apt update
RUN apt install -y mysql-server

WORKDIR /the/workdir/path

COPY . /the/workdir/path/.
COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

RUN cd /the/workdir/path
RUN chmod +x /the/workdir/path/mysql-init.sh
RUN /bin/bash -c /the/workdir/path/mysql-init.sh

EXPOSE 3306

CMD service mysql restart && tail -f /dev/null