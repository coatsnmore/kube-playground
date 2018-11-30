FROM node:8.12.0-alpine

WORKDIR /home/apps

COPY package.json ./
RUN npm install

# alpine extras
RUN apk add bash bash-doc bash-completion

COPY server.js ./

CMD ["node", "server.js"]