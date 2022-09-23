# Docker container
## Dockerfile
1. Change directory
```
cd first-container/
```
2. Inspect the Dockerfile, and build the container
```
docker build -t first-container .
```
3. View the Docker images
```
docker images
```
4. Publish port 8080 and make the application available
```
docker run -d -p 8080:8080 --name webapp first-container
```
5. View Docker container
```
docker ps
```
6. View the logs that are being captured from the container.
```
docker logs webapp
```
7. Launch a shell inside the container.
```
docker exec -it webapp /bin/sh
```
8. In the container, look at the contents of the /app folder and view the contents of /app/input.txt.
```
ls /app

cat /app/input.txt
```
9. View the processes on the container
```
ps -a
```
10. Stop and remove the running container.
```
docker stop webapp

docker rm webapp
```
### Modify the container
1. Create an `~/input.txt` file with five words, with each word on a new line.
```
printf "cinco\ncuatro\ntres\ndos\nuno" > ~/input.txt
```
2. Launch a container with the new file mounted in place of `/app/input.txt`.
```
docker run -d -p 8080:8080 \
-e MESSAGE_COLOR=#0000ff \
-v ~/input.txt:/app/input.txt \
--name webapp \
first-container
```
## Docker Registry (Docker hub)
1. Build Image
```
docker build -t hello-world .
```
2. Search Image
```
docker images --filter reference=hello-world
```
3. Login to Registry
```
cat docker-hub-pass | docker login --username fraj123 --password-stdin
```
4. Tag Image
```
docker tag hello-world:latest fraj123/hello-world:latest
```
5. Push Image
```
docker push fraj123/hello-world:latest
```
## Docker Registry (Private Registry AWS-ECR)
1. Build Image
```
docker build -t hello-world .
```
2. Search Image
```
docker images --filter reference=hello-world
```
3. Login to Registry
```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 392405208147.dkr.ecr.us-east-1.amazonaws.com
```
4. Create repository
```
aws ecr create-repository --repository-name hello-world --image-scanning-configuration scanOnPush=true --region us-east-1
```
5. Tag Image
```
docker tag hello-world:latest 392405208147.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest
```
6. Push the image
```
docker push 392405208147.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest
```

