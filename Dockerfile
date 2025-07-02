# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy the Quasar build to the Nginx html directory
COPY dist/spa /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]