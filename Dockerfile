#https://hub.docker.com/_/node/
#https://github.com/GoogleContainerTools/distroless/blob/main/README.md
FROM node:24-alpine AS build
WORKDIR /wikiless
COPY . /wikiless
RUN npm install -omit=optional
FROM gcr.io/distroless/nodejs22-debian12
COPY --from=build /wikiless /wikiless
WORKDIR /wikiless
COPY wikiless.config config.js
CMD ["src/wikiless.js"]
