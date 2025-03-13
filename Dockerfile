FROM node:22-alpine AS build 

WORKDIR /app

COPY package*.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn build

FROM node:22-alpine 

WORKDIR /app

RUN yarn global add serve

COPY --from=build /app/build /app

EXPOSE 3000

CMD ["serve", "-s", "."]