# docker_nerves

## Installation with DockerHub

```zsh
docker pull zacky1972/nerves
```

## Update DockerHub

```zsh
docker image build --rm --no-cache --pull -t zacky1972/nerves .
docker login
docker push zacky1972/nerves
```
