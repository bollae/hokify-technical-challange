FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
RUN npm install @types/express --save-dev


COPY . .

EXPOSE 8080

CMD ["npm", "start"]
