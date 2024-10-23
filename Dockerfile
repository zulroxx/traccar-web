# Use the official Node.js image as the base image
FROM node:22-bullseye

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# install yarn
RUN npm install -g yarn

# Install dependencies
RUN yarn install


# Copy the rest of the application files
COPY . .

# Build the React application
RUN yarn build

# Install a simple HTTP server to serve the React app
# RUN npm install -g serve

# Expose the port that the app will run on
EXPOSE 3000

# Serve the app using the `serve` package
# CMD ["serve", "-s", "build", "-l", "3000"]

CMD ["yarn", "start"]