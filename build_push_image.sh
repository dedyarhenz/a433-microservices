#!/bin/sh

#membuat image dengan nama item-app dan tag v1 dari folder tempat ini sesuai file buil_push_image.sh berada
docker build -t item-app:v1 .

#merubah nama image sesuai dengan GitHub Packages supaya bisa diupload di GitHub Packages
docker tag item-app:v1 ghcr.io/dedyarhenz/item-app:v1

#ganti username sesuai github anda
USERNAME=dedyarhenz
#ganti token sesuai yang anda buat di github 
TOKEN=your-token
#login ke github packages
echo $TOKEN | docker login ghcr.io -u $USERNAME --password-stdin

#upload file image ke GitHub Packages
docker push ghcr.io/dedyarhenz/item-app:v1