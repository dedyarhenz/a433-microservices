#download dan meggunakan image node js versi 18 alphine dari docker hub 
FROM node:18-alpine

#instal bash
RUN apk add --no-cache bash

#download wait-for-it.sh
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

#ubah hak akses
RUN chmod +x /bin/wait-for-it.sh

#menetapkan working direktori ke folder app di container jadi semua perintah selanjutnya akan dilakukan di folder app
WORKDIR /app

#menyalin semua file dan folder saat ini yang terletak sesuai file dockerfile berada lalu di taruh di folder /app di container 
COPY . .

#setting variable NODE_ENV
ENV NODE_ENV=production

#menjalankan perintah npm install dengan mode production, parameter --unsafe-perm agar semuah perintah menggunakan root user
RUN npm install --production --unsafe-perm

#untuk mengekpose port dari aplikasi kita agar bisa di akses
EXPOSE 3001

#menjalankan perintah npm start saat aplikasi kita mulai dijalankan di container
CMD [ "npm", "start" ]