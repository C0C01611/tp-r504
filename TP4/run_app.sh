#!/bin/bash
docker run --name tp4-app \
  --network net-tp4 \
  -p 5000:5000 \
  -d im-tp4
