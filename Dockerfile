# Etapa 1: Construcción de la aplicación Angular
FROM node:20-alpine as build
WORKDIR /app
RUN npm install -g @angular/cli
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Etapa 2: Configuración del servidor Nginx
FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/tesis /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]