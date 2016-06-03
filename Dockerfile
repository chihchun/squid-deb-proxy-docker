FROM muccg/squid-deb-proxy
MAINTAINER https://github.com/chihchun
WORKDIR /tmp
RUN curl -s http://mirrors.ubuntu.com/ | sed -n 's/.*<a href="\(...txt\)">.*/\1/; ta; b; :a; s%.*\n%%;p' > country.txt \
 && for i in $(cat country.txt) ; do curl http://mirrors.ubuntu.com/$i | sed -e s%^http://%% -e s%/.*$%% >> /etc/squid-deb-proxy/mirror-dstdomain.acl.d/90-ubuntu ; done
