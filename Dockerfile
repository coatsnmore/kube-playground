FROM node:8.12.0-alpine

WORKDIR /home/apps

COPY package.json ./

RUN npm install

# alpine extras for debugging
RUN apk add bash bash-doc bash-completion curl

COPY . ./

# start app
# CMD ng serve --host 0.0.0.0
CMD ["npm", "run", "start-in-container"]