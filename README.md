# k6apiv1
K6 API - v1 - Feb 28 2022


Use command executor to build k6 API as a docker container. Dockerfile enclosed.
https://github.com/vrest-io/command-executer

Installation:
clone the command-executer repo from above link.
Add Dockerfile as below:
-------------------------------------------------------
FROM node:16-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Add rpm package-manager, download k6 and install

RUN apk add rpm

RUN wget https://github.com/grafana/k6/releases/download/v0.35.0/k6-v0.35.0-linux-amd64.rpm && rpm -ivh k6-v0.35.0-linux-amd64.rpm

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 80
CMD [ "node", "server.js" ]
-------------------------------------------------------

Build docker container. It runs as a webapp on port 80.

Any questions, contact Sudhir Hosakote Sathyamurthy
