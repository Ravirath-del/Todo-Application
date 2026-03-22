FROM ubuntu AS build
WORKDIR /todo
COPY . .
RUN apt update && apt install curl -y && curl -s https://deb.nodesource.com/setup_16.x | bash && sudo apt install nodejs -y
RUN npm install && npm run build
FROM nginx:alpine
COPY --from=build /todo/build /usr/share/nginx/html
