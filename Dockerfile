FROM alpine:edge

# Installs required packages, included latest chromium.
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nano \
    nodejs \
    yarn \
    npm 

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package from the step above.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Puppeteer v1.19.0 works with Chromium 77.
RUN yarn add puppeteer@1.19.0 

# pa11y will try run it's own chromium so we must override that to point the one in this container
# within the .pa11y-ci.json file
RUN npm install -g pa11y-ci

# Add user so we don't need --no-sandbox. 
# Not working properly so we use the workaround of adding --no-sandbox in config for now.
RUN addgroup -S pptruser && adduser -S -g pptruser pptruser \
    && mkdir -p /home/pptruser/Downloads /app \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /app

# Run everything after as non-privileged user.
USER pptruser