FROM node:lts-alpine as build-sted
RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install 

COPY . /app

RUN npm run build --prod

#Segunda fase

FROM nginx:1.19.0-alpine

COPY  --from=build-sted /app/dist/proyecto-pymes /usr/share/nginx/html