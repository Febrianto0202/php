## [Quickstart](#quickstart)
Clone the repository to your local:
```
https://github.com/Febrianto0202/php-fpm.git
```

Follow the steps in the [configuration](#configuration) section of this
document.

### Run with Docker
To create a new instance of the server with [Docker](https://www.docker.com/) installed, ensure that you have followed the steps in the quickstart guide above, then and build an image locally. (Note that Docker must be installed):
```sh
docker build -t php-fpm .
```
You can then run the container and make available the relevant port (`9000` by default):
```sh
docker run -d -p 9000 php-fpm
```
If running on a cloud server, you'll probably need to zero out the host IP:
```sh
docker run -d -p 0.0.0.0:9000 php-fpm
```
