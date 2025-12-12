# Stage 1: Build the application (using Node 18)
FROM node:18 as builder

WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies and build the app
# The pipeline handles npm install outside, but including it here is best practice for Docker builds
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the application (using Nginx)
FROM nginx:alpine

# Copy the built production files from the builder stage into Nginx's HTML directory
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 (standard for Nginx)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]