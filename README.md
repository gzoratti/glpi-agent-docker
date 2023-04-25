# glpi-agent-docker

# GLPI Agent

Here the first image of GLPI agent based on bitmani:minideb, 
that image was developp to be use with docker-compose.
(more explanation will coming soon)





## Docker-compose

To deploy this project with docker-compose

```bash
version: "3.8"
services:
   glpi-agent:
    tty: true
    image: gzoratti/glpi-agent:1.4
    network_mode: "host"
    deploy:
      replicas: 1
      resources:
        limits:
          cpus: "2" #can me modify if you add glpi option to the agent
          memory: 4G #can me modify if you add glpi option to the agent
      restart_policy:
        condition: on-failure

```


## Authors

- [@gzoratti](https://www.github.com/gzoratti)

