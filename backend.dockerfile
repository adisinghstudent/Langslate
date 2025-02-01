FROM node:18-slim

WORKDIR /home/langslate

COPY src /home/langslate/src
COPY tsconfig.json /home/langslate/
COPY drizzle.config.ts /home/langslate/
COPY package.json /home/langslate/
COPY yarn.lock /home/langslate/

RUN mkdir /home/langslate/data
RUN mkdir /home/langslate/uploads

RUN yarn install --frozen-lockfile --network-timeout 600000
RUN yarn build

CMD ["yarn", "start"]