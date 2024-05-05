# Use an official Node.js image as the base image
FROM node:current-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the rest of your application code to the container
COPY . .

# Install application dependencies
RUN npm install

# install libx11: https://stackoverflow.com/questions/71387999/node-js-puppeteer-failing-in-docker-error-while-loading-shared-libraries-lib
RUN apt-get update

RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libnss3 lsb-release xdg-utils wget

# install Chinese font: https://github.com/puppeteer/puppeteer/issues/1143
RUN apt-get install fonts-wqy-zenhei

# Expose the port your application listens on (adjust as needed)
EXPOSE 9000

# Define the command to start your application
CMD ["npm", "start"]
