## Minimal docker configuration to run Laravel

### Installation guide

```sh
$ git clone https://github.com/wescmx/docker-laravel.git

$ cd docker-laravel

$ docker-compose up -d
```

### Getting started

```sh
$ cd src && rm .gitkeep

$ docker-compose run --rm composer create-project laravel/laravel .
```

Access the application at: `127.0.0.1`

### Executing commands

```sh
$ docker-compose run --rm composer --version

$ docker-compose run --rm artisan -V

$ docker-compose run --rm npm -v
```
