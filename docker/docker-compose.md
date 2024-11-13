# Docker Compose

Docker compose is a tool that is used for defining and running multi-container Docker apps in an easy way.
It provides `docker-compose.yml` configuration file that can be used to bring up an app and the suite of services it depends on 
with just one command.

* `docker compose up` - start all services from `docker-compose.yml`
* `docker compose up db` - start only service `db`
* `docker compose up --build` - rebuild all images and run containers
* `docker compose -f docker-compose.prod.yml up` - start all services from `docker-compose.prod.yml`
* `docker compose -f docker-compose.yml -f docker-compose.staging.yml up -d` - run Docker Compose and override config file
* `docker compose build db` - rebuild `db` service
* `docker compose down`
* `docker compose down --remove-orphans` - remove containers for services not defined in the Compose file.
* `docker compose down -v` - shutdown containers, remove volumes. Docker stores volumes at `/var/lib/docker/volumes` 
* `docker compose logs db | less` - show logs of `db` container
* `docker compose ps` - show running app's containers
* `docker compose exec fpm bash` - connect to running *fpm* container and start `bash` console in it
* `docker compose exec db mysql -u root -ppassword` - connect to running *db* container and start mysql console
* `docker compose run --rm php-cli sh` - run *php-cli* container, start `sh` console. `--rm` - Docker also removes the anonymous volumes associated with the container when the container is removed.
* `docker compose rm db` - remove `db` container
* `docker compose rm -fv` - remove all containers with volumes
* `docker compose config` - show `docker-compose.yml` content after the substitution step has been performed

## Proxy settings for Docker

If you see an error:
```
docker compose up
Pulling db (mysql:)...
ERROR: Get https://registry-1.docker.io/v2/: Proxy Authentication Required
```
you should configure your Docker's proxy settings (see [stackoverflow](https://stackoverflow.com/a/28093517/1921272)).

1. Create file `/etc/systemd/system/docker.service.d/http-proxy.conf`:

```
[Service]
Environment="HTTP_PROXY=http://kenny:123@277.27.16.233:3118"
Environment="HTTPS_PROXY=http://kenny:123@277.27.16.233:3118"
Environment="NO_PROXY=localhost,127.0.0.1,localaddress,.localdomain.com"
```

2. Reload `docker`:

```
sudo service docker restart
```

3. Check if it works:

```
docker pull busybox
```

## Environment variables

Example of `docker-compose.yml` with env variables:

```yml
services:
    database:
        image: postgres:${POSTGRES_VERSION:-15}-alpine
        environment:
            POSTGRES_DB: ${POSTGRES_DB:-app}
            POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-123}
            POSTGRES_USER: ${POSTGRES_USER:-app}
        volumes:
            - database_data:/var/lib/postgresql/data:rw
```

We can pass environment variables to `docker-compose.yml` files in these ways:

1. By exporting the variable to the terminal before running docker compose:
    ```
    POSTGRES_PASSWORD=123 docker compose config
    ```
2. By putting the variables inside `.env` file:
    ```
    POSTGRES_PASSWORD=123
    ```

The `env_file` option only passes those extra variables to the containers and not the `docker-compose.yml` file.

## docker-compose.yml

### `build`, `image`

If we use `build` and `image`, the image will be built and will then be tagged based on the name given using `image`:

```yml
services:
    some-service:
        build: .
        image: some-service:1.5
```

### `healthcheck`

```yml
services:
    some-service:
        # ...
        healthcheck:
            test: ["CMD", "curl", "-f", "http://localhost:8080/ping"]
            interval: 20s
            timeout: 10s
            retries: 3
            start_period: 5s
```

Every 20 seconds after an initial period of 5 seconds, a ping to some-service will be issued using 
`curl` with a timeout of 10 seconds. In case of failure, there should be 3 retries before marking the 
instance unhealthy. 
We use `curl` with `-f` option: fail fast with no output on HTTP errors.

Run `docker ps` to see if container's status is healty or unhealty.

*Links:*

- [Change pre-defined environment variables in Docker Compose](https://docs.docker.com/compose/reference/envvars/).
- [Ways to set environment variables in Compose](https://docs.docker.com/compose/environment-variables/set-environment-variables/)