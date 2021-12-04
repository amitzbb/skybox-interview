global
    log /dev/log local0
    log localhost local1 notice
    maxconn 2000
    daemon
 
defaults
    log global
    mode http
    option httplog
    option dontlognull
    retries 3
    timeout connect 5000
    timeout client 50000
    timeout server 50000
 
frontend http-in
    bind *:80
    default_backend webservers
 
backend webservers
    stats enable
    stats auth admin:admin
    stats uri /haproxy?stats
    balance roundrobin
    option forwardfor
    option http-server-close
    option httpchk GET /health
%{~ for app in backendPools }
    server ${app} ${app}:5000 check
%{~ endfor }