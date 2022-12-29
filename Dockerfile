FROM node:19.3.0-alpine3.16

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm i --force

COPY . /app

RUN npm run build


EXPOSE 3000

CMD ["npm", "start"]