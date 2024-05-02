# Container image that runs your code
FROM node:19-alpine3.16

RUN apk add bash curl jq coreutils sed

# Copies your code file from your action repository to the filesystem path `/` of the container
WORKDIR /usr/app
COPY ./ /usr/app

RUN npm install

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/usr/app/bin/gen-typemap"]
