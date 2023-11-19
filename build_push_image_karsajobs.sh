#!/bin/sh

#membuat image dengan nama ghcr.io/dedyarhenz/karsajobs:latest dari folder tempat ini sesuai file build_push_image_karsajobs_ui.sh berada
docker build -t ghcr.io/dedyarhenz/karsajobs:latest .

#ganti username sesuai github anda
USERNAME=dedyarhenz
#ganti token sesuai yang anda buat di github 
TOKEN=your-token
#login ke github packages
echo $TOKEN | docker login ghcr.io -u $USERNAME --password-stdin

#upload file image ke GitHub Packages
docker push ghcr.io/dedyarhenz/karsajobs