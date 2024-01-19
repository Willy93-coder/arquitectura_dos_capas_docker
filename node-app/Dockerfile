#FROM ubuntu:22.04
FROM node:20.11.0-bookworm

WORKDIR /the/workdir/path

COPY . /the/workdir/path/.

RUN cd /the/workdir/path && npm install

EXPOSE 3000

CMD node index.js