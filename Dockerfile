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
COPY --from=build /app/dist/tesis/browser /usr/share/nginx/html

EXPOSE 80