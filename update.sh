#!/bin/sh
docker compose build
docker compose exec web yarn cache clean
docker compose exec web yarn build:production
docker compose run --rm web rails assets:precompile
docker compose exec web yarn build:production
docker compose up -d

docker compose exec web yarn cache clean
docker compose exec web yarn build:production
docker compose run --rm web rails assets:precompile
docker compose exec web yarn build:production
docker compose up -d
