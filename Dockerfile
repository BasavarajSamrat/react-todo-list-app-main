#FROM node:14  as builder
#WORKDIR /app
#COPY package.json .
#RUN npm install
#COPY . .
#RUN npm run build

#FROM nginx
#EXPOSE 80
#COPY --from=builder /app/build /usr/share/nginx/html

# Dockerfile
FROM node:16 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Serve the build folder with Nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
