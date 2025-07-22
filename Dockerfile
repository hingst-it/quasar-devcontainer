# Stage 1: Build the Quasar app
FROM node:24 AS build-stage
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Create the .htpasswd file with basic auth credentials
ARG HTUSER=myuser
ARG HTPASSWD=mypassword
RUN mkdir -p /etc/nginx \
 && apt-get update \
 && apt-get install -y --no-install-recommends apache2-utils \
 && htpasswd -c -B -b /etc/nginx/.htpasswd "$HTUSER" "$HTPASSWD" \
 && rm -rf /var/lib/apt/lists/*

# Stage 2: Serve the Quasar app using nginx
FROM nginx:alpine AS production-stage
COPY --from=build-stage /app/dist/spa /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /etc/nginx/.htpasswd /etc/nginx/.htpasswd
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
