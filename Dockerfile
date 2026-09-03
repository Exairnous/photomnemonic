FROM node:lts-bullseye
WORKDIR /app

RUN apt-get update && apt-get -y install libnss3 libexpat1

COPY package.json package-lock.json /app/
run npm i @sparticuz/chromium
RUN npm ci

COPY app.js index.js utils.js /app/
# user nobody
CMD node app.js
