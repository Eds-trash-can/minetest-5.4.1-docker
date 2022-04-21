FROM debian:11-slim as builder

RUN apt update
RUN apt install make libc6-dev cmake libpng-dev libbz2-dev libjpeg-dev libirrlicht-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libcurl4-gnutls-dev libfreetype6-dev zlib1g-dev libgmp-dev libjsoncpp-dev libzstd-dev libluajit-5.1-dev git g++-9 -y

WORKDIR /
RUN git clone --branch 5.4.1 --depth 1 https://github.com/minetest/minetest.git
WORKDIR /minetest

RUN cmake . -DRUN_IN_PLACE=TRUE -DBUILD_CLIENT=FALSE -DBUILD_SERVER=TRUE -DENABLE_LUAJIT=ON -D CMAKE_CXX_COMPILER=g++-9
RUN make -j$(nproc)

EXPOSE 30000 30000

CMD [ "/minetest/bin/minetestserver", "--config", "/config/config.yml", "--world", "/minetest/world", "--gameid", "game", "--port", "30000"]
