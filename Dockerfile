FROM node:22-slim
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev
COPY scripts ./scripts
RUN npm run fetch-scramjet
COPY server.js ./
COPY public ./public
# scramjet/ and controller/ are generated above into the working folder; move them next to the hub
RUN mkdir -p public && for d in scramjet controller; do [ -d "$d" ] && cp -r "$d" public/ || true; done
ENV PORT=8080
EXPOSE 8080
CMD ["node","server.js"]
