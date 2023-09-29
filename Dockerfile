#download dan meggunakan image node js versi 14 alphine dari docker hub 
FROM node:14-alpine

#menetapkan working direktori ke folder app di container jadi semua perintah selanjutnya akan dilakukan di folder app
WORKDIR /app

#menyalin semua file dan folder saat ini yang terletak sesuai file dockerfile berada lalu di taruh di folder /app di container 
COPY . .

#setting variable NODE_ENV dan DB_HOST
ENV NODE_ENV=production DB_HOST=item-db

#menjalankan perintah npm install dengan mode production, parameter --unsafe-perm agar semuah perintah menggunakan root user lalu npm run build untuk membuid aplikasi kita
RUN npm install --production --unsafe-perm && npm run build

#untuk mengekpose port 8080 dari aplikasi kita agar bisa di akses
EXPOSE 8080

#menjalankan perintah npm start saat aplikasi kita mulai dijalankan di container
CMD [ "npm", "start" ]