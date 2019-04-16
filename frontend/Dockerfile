FROM node:10

ENV APP /usr/src/app
RUN mkdir $APP
WORKDIR $APP

RUN apt-get update -qq 
COPY package.json yarn.lock $APP/
RUN yarn

COPY . $APP/

ENV HOST 0.0.0.0
CMD ["yarn", "run", "dev"]
