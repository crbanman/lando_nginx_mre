# Lando NGINX MRE

This repository is an minimal reproducible example (MRE) of an NGINX reverse proxy issue that was introduced in Lando v3.22.

I've included two examples:

1. `nginx-broken`
   - This example worked pre-v3.22
2. `nginx-working`
   - through some testing I've figured out a way to make it work but it's more of a workaround

## What does the example do?

The examples contain a simple reverse proxy that will proxy requests from `/proxy` to a node server running on the host at `localhost:3000`.

## Running an example

1. cd into the directory of your choosing `cd nginx-working`
2. `lando start`
3. cd back into the base directory and run `node server.js`
4. You can then go to the URL of the services you started https://nginx-working.lndo.site
   - You should see "Hello from NGINX!"
5. You can then go to the proxy path https://nginx-working.lndo.site/proxy
   - In the working example you should see "Hello from Node.js! You are on the path: /proxy"
   - In the broken example you should get a 404 error

## Problem

In the broken, previously working, example you now get an error that the host is not found.

```bash
nginx_1  | 2024/10/17 18:05:50 [error] 232#232: *5 host.lando.internal could not be resolved (3: Host not found), client: 172.19.0.2, server: localhost, request: "GET /proxy HTTP/1.1", host: "nginx-broken.lndo.site"
```
