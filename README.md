
# GLPI Agent

Here the first image of GLPI agent based on bitmani:minideb, 
that image was developp to be use with docker-compose.

You've to build your own version of glpi-agent because he need to use two parameters to work perfectly 
( url of glpiinventory and also the tag for your inventory )

### 1. Docker Run

```bash
docker run --name glpi-agent -e "url=<url of glpiinventory>" -e "tag=<wish inventory tag>" --network="host" gzoratti/glpi-agent:<version>

```

### 2. Docker-compose

To deploy this project with docker-compose

```bash
  glpi-agent:
    tty: true
    image: glpi-agent:<version>
    network_mode: "host"
    environment:
      - "url=<url of glpiinventory"
      - "tag=<wish inventory tag>"
    deploy:
      replicas: 1
      resources:
        limits:
          cpus: "2"
          memory: 4G
      restart_policy:
        condition: on-failure



```
### 3. Docker Build

## Authors

- [@gzoratti](https://www.github.com/gzoratti)

