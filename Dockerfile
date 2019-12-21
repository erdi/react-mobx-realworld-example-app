FROM node:lts-alpine as builder
WORKDIR /home/realworld/app
COPY . /home/realworld/app
RUN npm install
RUN yarn build

FROM node:lts-alpine
WORKDIR /home/realworld/app
COPY --from=0 /home/realworld/app/build/ .
RUN yarn global add serve
EXPOSE 5000
ENTRYPOINT serve -s .