
# Photomosaic-DMM

## pre-requirements

- postgres docker
- minio docker
- minio-ui (optional : if you need admin dashboard page to check minio)

### how to deploy docker
 
```zsh
cd docker
docker-compose up -d
```

- Please modify the `docker-compose.yaml` in docker directory for custom configuration

## front

- You can develop front with flutter on `front` directory
- Please use `front/deploy.sh` to deploy front
  ```zsh
  bash front/deploy.sh
  ```

## How to run

```zsh
go run main.go
```
