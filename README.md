# What is **centos-node** ?
A minimum Centos 8 based OS which already equipped with NodeJS latest stable (LTS) release.

# How to Use this Image ?
In essence, there are two ways to use this image based on your needs as described on the following section below respectively.

## Run the image directly from Public Docker Hub registry
1. Ensure you have docker client within your machine.
2. Fire-up the *terminal*
3. Run the image using this following command:
```
docker run -it yauritux/centos-node
```

## Use it as your Base Image within your Dockerfile
```
FROM yauritux/centos-node:latest
```

# LICENSE
View [license](https://www.apache.org/licenses/) information for the software contained in this image.

# Supported Docker Versions
This image is officially supported on Docker version 19.03.8.
Please see [the docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

# User Feedback
## Issues
If you have any problems with or questions about this image, please contact me through a [Github issue](https://github.com/yauritux/centos-node/issues).
