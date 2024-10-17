server {
    listen 80 default_server;
    listen 443 ssl;
    server_name localhost;
    ssl_certificate           /certs/cert.crt;
    ssl_certificate_key       /certs/cert.key;
    ssl_verify_client         off;
    ssl_session_cache    shared:SSL:1m;
    ssl_session_timeout  5m;
    ssl_ciphers  HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers  on;
    port_in_redirect off;
    client_max_body_size 100M;
    server_name  localhost;

    location / {
        root   "{{LANDO_WEBROOT}}";
        index  index.html index.htm;
    }

    resolver 127.0.0.11 valid=60s;
    set $proxy_url "http://{{LANDO_HOST_IP}}:3000";
    location ~ /proxy {
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass $proxy_url;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   "{{LANDO_WEBROOT}}";
    }
}