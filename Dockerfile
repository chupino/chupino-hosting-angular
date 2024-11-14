# frontend/Dockerfile
FROM node:20-alpine
WORKDIR /app
RUN npm install -g @angular/cli
COPY package.json package-lock.json ./
RUN npm install
COPY . .
EXPOSE 4200

CMD ["npm", "run", "build", "--prod"]
