# temp container
FROM node:16-alpine as builder
WORKDIR '/app'
COPY  package.json .
RUN npm install
COPY . .
RUN  npm run build

# run nginx server get only the build folder
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html