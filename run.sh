#!/bin/bash

mkdir -p cache

docker run \
  -v $(pwd)/default.vcl:/etc/varnish/default.vcl:ro \
  -v $(pwd)/cache:/cache \
  --tmpfs /var/lib/varnish/varnishd:exec \
  --name varnish \
  --rm \
  -p 8080:80 \
  varnish:7.4.2 \
  varnishd -F -a :80 -f /etc/varnish/default.vcl -s file,/cache/cfile,1g

