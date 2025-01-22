# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Install curl in the container
RUN apk add --no-cache curl


# Set the working directory in the container
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json for installing dependencies
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy the entire application into the container
COPY . .

# Expose the port the app listens on
EXPOSE 3000



# Define the command to run the app
CMD ["npm", "start"]
