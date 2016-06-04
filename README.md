
Squid server for cahing distro packages.

### Usage

    # start the server
    docker run --name squid-deb-proxy -d -v squid:/data chihchun/squid-deb-proxy

    # pass the server IP address via http_proxy enviromenet.
	docker build \
    --build-arg http_proxy=http://$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' squid-deb-proxy):8000 .

## Other use case
    # See the access by runing the docker instance in frontend
    docker run --name squid-deb-proxy \
        -i -t --rm -v squid:/data chihchun/squid-deb-proxy

    # The squid server by default only allow whitelisted archive server
    # you can disable ACL with the "USE_ACL=0" enviromenet, which allow you
    # to cache all requests.
    docker run --name squid-deb-proxy \
    -e USE_ACL=0 \
    -i -t --rm -v squid:/data chihchun/squid-deb-proxy


#### upsteam

* muccg/docker-squid-deb-proxy: Docker image for squid-deb-proxy - https://github.com/muccg/docker-squid-deb-proxy
* pmoust/squid-deb-proxy: Docker image of a generic squid-deb-proxy server - Use in your local organisation / LAN - https://github.com/pmoust/squid-deb-proxy
* yasn77/docker-squid-repo-cache: Squid Cache for repositories - https://github.com/yasn77/docker-squid-repo-cache
