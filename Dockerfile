FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  ffmpeg \
  wget \
  yarn \
  webp \
  imagemagick && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN yarn
RUN pwd
RUN ls

COPY . .


#awal pm2
#USER PM2 DI SINI kalau mau makek pm2 yang CMD ["npm","run","dev"] di Block aja command nya

# RUN npm install pm2 -g
# ENV PM2_PUBLIC_KEY isidisini
# ENV PM2_SECRET_KEY isidisini
# CMD pm2-runtime start run.js --name botwa

#akhir pm2

EXPOSE 5000
CMD ["npm","run","dev"] #run via nodemon