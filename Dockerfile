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
