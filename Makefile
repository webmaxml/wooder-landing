install: ruby-install node-install

build: jekyll-build sass-build dist-owner

dist-owner:
	sudo chown -R ${USER}:${USER} dist

ruby-shell:
	docker-compose run --rm ruby bash

ruby-install:
	docker-compose run --rm ruby bash -c "bundle install"

node-shell:
	docker-compose run --rm node bash

node-install:
	docker-compose run --rm node bash -c "npm install"

jekyll-watch:
	docker-compose run --rm ruby bash -c "bundle exec jekyll build --watch"

jekyll-build:
	docker-compose run --rm ruby bash -c "bundle exec jekyll build"

sass-watch:
	docker-compose run --rm node bash -c "npx sass --watch src/sass/index.scss dist/css/style.css"

sass-build:
	docker-compose run --rm node bash -c "npx sass src/sass/index.scss dist/css/style.css"

sync:
	docker-compose run --rm -p 3000:3000 node bash -c "npx browser-sync start --server dist --files dist --port 3000 --no-open --no-ui --no-notify --no-inject-changes"
