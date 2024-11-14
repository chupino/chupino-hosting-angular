# frontend/Dockerfile
FROM node:20-alpine as build
WORKDIR /app
RUN npm install -g @angular/cli
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx:alpine
COPY --from=build /app/dist/tesis /usr/share/nginx/html
EXPOSE 80