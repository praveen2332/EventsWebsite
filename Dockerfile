FROM node:14.17.5 as web
WORKDIR /app
COPY . /app
RUN ls -l
RUN npm install
RUN npm run build
RUN ls -l
WORKDIR /app/dist/events-website
RUN ls -l
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=web /app/dist/events-website /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf





EXPOSE 5000
