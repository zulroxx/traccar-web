# Use the official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React application
RUN npm run build

# Install a simple HTTP server to serve the React app
RUN npm install -g serve

# Expose the port that the app will run on
EXPOSE 3000

# Serve the app using the `serve` package
CMD ["serve", "-s", "build", "-l", "3000"]