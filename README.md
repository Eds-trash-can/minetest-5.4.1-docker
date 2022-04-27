# minetest 5.4.1 docker

A dockerfile for minetest 5.4.1 servers.
based on debian 11 slim

uses **g++-9**

---

### Volumes:

- `/minetest/game/game` - the game of the server (like minetest_game / devtest / mineclone2)
- `/minetest/worlds/world` - the world
- `/config/config.yml` - configuration

### Ports:

Server listens on `30000` inside docker.
