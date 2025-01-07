#!/bin/bash
docker run --name tp4-mysql \
  --network net-tp4 \
  -e MYSQL_ROOT_PASSWORD=foo \
  -e MYSQL_DATABASE=tp4_db \
  -p 3307:3306 \
  -d mysql:latest
