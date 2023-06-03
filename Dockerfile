FROM node:12-alpine as buildStage

WORKDIR /app
COPY . .

RUN npm install -production
RUN npm prune --production

FROM node:12-alpine as finalStage

WORKDIR /app
COPY --from=buildStage /app . 

EXPOSE 8090

CMD ["node", "server.js"]
