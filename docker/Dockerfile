# Use an official Node.js image as the base
FROM node:18-bullseye-slim

# Install git and other necessary dependencies
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /nmap-viewer

# Clone the nmap-viewer repository
RUN git clone https://github.com/psyray/nmap-viewer.git .

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Install serve
RUN npm install -g serve

# Expose port 3001
EXPOSE 3001

# Start the application
CMD ["serve", "-s", "build", "-l", "3001"]