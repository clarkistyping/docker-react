FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# the output of the line below is the build folder
RUN npm run build

# /app/build will be the contents we need to copy over to the run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html



