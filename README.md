# This is project to get [Hyku](https://github.com/projecthydra-labs/hyku.git) running in docker environment for evaluation purposes only.


There are two docker-compose files dockre-compose.yml and docker-compose-setup.yml.
You will need to run docker-compose-setup.yml once before very fist time you start Hyku to setup database and
seed it with data.

## Prerequisites:

  1. [Install Docker](https://docs.docker.com/engine/installation/)
  2. [Install Docker Compose](https://docs.docker.com/compose/install/)
  3. Clone current project:
     ```shell
     git clone https://github.com/ualbertalib/didocker_hyku.git
     ```
  5. Pull all necessary images
     ```shell
     docker-compose pull
     ```

## Running (docker-compose-setup.yml):

You will need to run docker-compose-setup.yml to setup database and seed it with data

Use the `up` command to launch the containers:

```shell
docker-compose -f docker-compose-setup.yml up
```

Once database has been created and populated with data (no more logs comming to the terminal)
hit `CTRL+C` to stop the containers and return the control to the terminal.


## Running (docker-compose.yml):

Edit .env and set the HOSTPORT environment variable to point to the port on the host machine where app will run.
Default values is port 8100


Use the `up` command to launch all containers in the background:

```shell
docker-compose up -d
```

You'll then have to use the following command when you'll want to stop the
containers:

```shell
docker-compose stop
```

To view the application point your browser to [http://localhost:8100](http://localhost:8100)
(unless you change HOSTPORT variable to point to the different port)


## Inspecting Sor and Fedora:

Edit docker-compose.yml file and uncoment lines that exposes solr and fedora ports:

- for Solr
```
#    ports:
#      - 8983:8983
```

- for Fedora
```
#    ports:
#      - 8080:8080
```


Restart:

```shell
docker-compose restart
```

## Troubleshooting

If something does not work look at the log for an appropriate container (usually it is web)
using `docker logs -f <container_name>` to see logs from a given container


## Useful commands:

 * `docker ps -`                                 to see all running containers
 * `docker logs -f <container_name>`             to see logs from a given container
 * `docker exec -it <container_name> /bin/bash`  to start shell inside running container
 * `docker-compose up -d`                        to start all containers and bring application up
 * `docker-compose down`                         to stop all running containers and bring application down
 * `docker-compose restart`                      to restart application
 *  for more info here is link to [docker-compose reference page](https://docs.docker.com/compose/reference/)
 * `service --status-all`                        to show all running servies on Ubuntu
 * `netstat -tulpn`                              to see port usage


