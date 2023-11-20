#!/bin/sh

#membuat image dengan nama order-service dari folder tempat ini sesuai file buil_push_image.sh berada
docker build -t order-service:latest .

#merubah nama image sesuai dengan GitHub Packages supaya bisa diupload di GitHub Packages
docker tag order-service:latest ghcr.io/dedyarhenz/order-service:latest

#ganti username sesuai github anda
USERNAME=dedyarhenz
#ganti token sesuai yang anda buat di github 
TOKEN=your-token
#login ke github packages
echo $TOKEN | docker login ghcr.io -u $USERNAME --password-stdin

#upload file image ke GitHub Packages
docker push ghcr.io/dedyarhenz/order-service:latest