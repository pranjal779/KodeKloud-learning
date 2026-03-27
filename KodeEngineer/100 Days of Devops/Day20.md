# Day 20: Configure Nginx + PHP-FPM Using Unix Sock

refer this one:
https://medium.com/@janemils/kodekloud-engineer-day-20-configure-nginx-php-fpm-using-unix-sock-d23c3baaec21

<img width="955" height="942" alt="image" src="https://github.com/user-attachments/assets/a9b5df78-4e41-484d-8987-061c443c70f4" />

The Nautilus application development team is planning to launch a new PHP-based application, which they want to deploy on Nautilus infra in Stratos DC. 
The development team had a meeting with the production support team and they have shared some requirements regarding the infrastructure. Below are the requirements they shared:

a. Install nginx on app server 1 , configure it to use port 8099 and its document root should be /var/www/html.

b. Install php-fpm version 8.3 on app server 1, it must use the unix socket /var/run/php-fpm/default.sock (create the parent directories if don't exist).

c. Configure php-fpm and nginx to work together.

d. Once configured correctly, you can test the website using curl http://stapp01:8099/index.php command from jump host.

NOTE: We have copied two files, index.php and info.php, under /var/www/html as part of the PHP-based application setup. Please do not modify these files.

```sh
[tony@stapp01 ~]$ sudo vi /etc/nginx/nginx.conf
[tony@stapp01 ~]$ sudo systemctl enable nginx
Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /usr/lib/systemd/system/nginx.service.
[tony@stapp01 ~]$ sudo systemctl start nginx
[tony@stapp01 ~]$ sudo systemctl start nginx
[tony@stapp01 ~]$ sudo systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; preset: disabled)
     Active: active (running) since Fri 2026-03-27 13:12:04 UTC; 26s ago
    Process: 10165 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
    Process: 10166 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
    Process: 10173 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
   Main PID: 10180 (nginx)
      Tasks: 17 (limit: 404712)
     Memory: 16.0M
        CPU: 48ms
     CGroup: /system.slice/nginx.service
             ├─10180 "nginx: master process /usr/sbin/nginx"
             ├─10181 "nginx: worker process"
             ├─10182 "nginx: worker process"
             ├─10183 "nginx: worker process"
             ├─10184 "nginx: worker process"
             ├─10185 "nginx: worker process"
             ├─10186 "nginx: worker process"
             ├─10187 "nginx: worker process"
             ├─10188 "nginx: worker process"
             ├─10189 "nginx: worker process"
             ├─10190 "nginx: worker process"
             ├─10191 "nginx: worker process"
             ├─10192 "nginx: worker process"
             ├─10193 "nginx: worker process"
             ├─10194 "nginx: worker process"
             ├─10195 "nginx: worker process"
             └─10196 "nginx: worker process"

Mar 27 13:12:04 stapp01 systemd[1]: Starting The nginx HTTP and reverse proxy server...
Mar 27 13:12:04 stapp01 nginx[10166]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
Mar 27 13:12:04 stapp01 nginx[10166]: nginx: configuration file /etc/nginx/nginx.conf test is successful
Mar 27 13:12:04 stapp01 systemd[1]: Started The nginx HTTP and reverse proxy server.
[tony@stapp01 ~]$


```

```sh
[tony@stapp01 ~]$ cat vi /etc/nginx/nginx.conf
cat: vi: No such file or directory
# For more information on configuration, see:
#   * Official English Documentation: http://nginx.org/en/docs/
#   * Official Russian Documentation: http://nginx.org/ru/docs/

user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/doc/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 4096;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    server {
        listen       8099;
        listen       [::]:8099;
        server_name  stapp01;
        root         /usr/share/nginx/html;
        index index.php index.html

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }
    }

# Settings for a TLS enabled server.
#
#    server {
#        listen       443 ssl http2;
#        listen       [::]:443 ssl http2;
#        server_name  _;
#        root         /usr/share/nginx/html;
#
#        ssl_certificate "/etc/pki/nginx/server.crt";
#        ssl_certificate_key "/etc/pki/nginx/private/server.key";
#        ssl_session_cache shared:SSL:1m;
#        ssl_session_timeout  10m;
#        ssl_ciphers PROFILE=SYSTEM;
#        ssl_prefer_server_ciphers on;
#
#        # Load configuration files for the default server block.
#        include /etc/nginx/default.d/*.conf;
#
#        error_page 404 /404.html;
#            location = /40x.html {
#        }
#
#        error_page 500 502 503 504 /50x.html;
#            location = /50x.html {
#        }
#    }

}
```

```sh
[tony@stapp01 ~]$ sudo vi /etc/nginx/nginx.conf
[tony@stapp01 ~]$ sudo systemctl enable nginx
[tony@stapp01 ~]$ sudo systemctl start nginx
[tony@stapp01 ~]$ sudo systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; preset: disabled)
     Active: active (running) since Fri 2026-03-27 13:12:04 UTC; 5min ago
   Main PID: 10180 (nginx)
      Tasks: 17 (limit: 404712)
     Memory: 16.0M
        CPU: 48ms
     CGroup: /system.slice/nginx.service
             ├─10180 "nginx: master process /usr/sbin/nginx"
             ├─10181 "nginx: worker process"
             ├─10182 "nginx: worker process"
             ├─10183 "nginx: worker process"
             ├─10184 "nginx: worker process"
             ├─10185 "nginx: worker process"
             ├─10186 "nginx: worker process"
             ├─10187 "nginx: worker process"
             ├─10188 "nginx: worker process"
             ├─10189 "nginx: worker process"
             ├─10190 "nginx: worker process"
             ├─10191 "nginx: worker process"
             ├─10192 "nginx: worker process"
             ├─10193 "nginx: worker process"
             ├─10194 "nginx: worker process"
             ├─10195 "nginx: worker process"
             └─10196 "nginx: worker process"

Mar 27 13:12:04 stapp01 systemd[1]: Starting The nginx HTTP and reverse proxy server...
Mar 27 13:12:04 stapp01 nginx[10166]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
Mar 27 13:12:04 stapp01 nginx[10166]: nginx: configuration file /etc/nginx/nginx.conf test is successful
Mar 27 13:12:04 stapp01 systemd[1]: Started The nginx HTTP and reverse proxy server.
[tony@stapp01 ~]$

[tony@stapp01 ~]$ cat vi /etc/nginx/nginx.conf
cat: vi: No such file or directory
# For more information on configuration, see:
#   * Official English Documentation: http://nginx.org/en/docs/
#   * Official Russian Documentation: http://nginx.org/ru/docs/

user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/doc/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 4096;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    server {
        listen       8099;
        listen       [::]:8099;
        server_name  stapp01;
        root         /usr/share/nginx/html;
        index index.php index.html

        location ~ \.php$ {
                include fastcgi_params;
                fastcgi_pass unix:/var/run/php-fpm/default.sock;
                fastcgi_index index.php;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }
    }

# Settings for a TLS enabled server.
#
#    server {
#        listen       443 ssl http2;
#        listen       [::]:443 ssl http2;
#        server_name  _;
#        root         /usr/share/nginx/html;
#
#        ssl_certificate "/etc/pki/nginx/server.crt";
#        ssl_certificate_key "/etc/pki/nginx/private/server.key";
#        ssl_session_cache shared:SSL:1m;
#        ssl_session_timeout  10m;
#        ssl_ciphers PROFILE=SYSTEM;
#        ssl_prefer_server_ciphers on;
#
#        # Load configuration files for the default server block.
#        include /etc/nginx/default.d/*.conf;
#
#        error_page 404 /404.html;
#            location = /40x.html {
#        }
#
#        error_page 500 502 503 504 /50x.html;
#            location = /50x.html {
#        }
#    }

}



```

```sh
thor@jump-host ~$ curl http://stapp01:8099/index.php
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <title>The page is not found</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style type="text/css">
            /*<![CDATA[*/
            body {
                background-color: #fff;
                color: #000;
                font-size: 0.9em;
                font-family: sans-serif,helvetica;
                margin: 0;
                padding: 0;
            }
            :link {
                color: #c00;
            }
            :visited {
                color: #c00;
            }
            a:hover {
                color: #f50;
            }
            h1 {
                text-align: center;
                margin: 0;
                padding: 0.6em 2em 0.4em;
                background-color: #900;
                color: #fff;
                font-weight: normal;
                font-size: 1.75em;
                border-bottom: 2px solid #000;
            }
            h1 strong {
                font-weight: bold;
                font-size: 1.5em;
            }
            h2 {
                text-align: center;
                background-color: #900;
                font-size: 1.1em;
                font-weight: bold;
                color: #fff;
                margin: 0;
                padding: 0.5em;
                border-bottom: 2px solid #000;
            }
            h3 {
                text-align: center;
                background-color: #ff0000;
                padding: 0.5em;
                color: #fff;
            }
            hr {
                display: none;
            }
            .content {
                padding: 1em 5em;
            }
            .alert {
                border: 2px solid #000;
            }

            img {
                border: 2px solid #fff;
                padding: 2px;
                margin: 2px;
            }
            a:hover img {
                border: 2px solid #294172;
            }
            .logos {
                margin: 1em;
                text-align: center;
            }
            /*]]>*/
        </style>
    </head>

    <body>
        <h1><strong>nginx error!</strong></h1>

        <div class="content">

            <h3>The page you are looking for is not found.</h3>

            <div class="alert">
                <h2>Website Administrator</h2>
                <div class="content">
                    <p>Something has triggered missing webpage on your
                    website. This is the default 404 error page for
                    <strong>nginx</strong> that is distributed with
                    Red Hat Enterprise Linux.  It is located
                    <tt>/usr/share/nginx/html/404.html</tt></p>

                    <p>You should customize this error page for your own
                    site or edit the <tt>error_page</tt> directive in
                    the <strong>nginx</strong> configuration file
                    <tt>/etc/nginx/nginx.conf</tt>.</p>

                    <p>For information on Red Hat Enterprise Linux, please visit the <a href="http://www.redhat.com/">Red Hat, Inc. website</a>. The documentation for Red Hat Enterprise Linux is <a href="http://www.redhat.com/docs/manuals/enterprise/">available on the Red Hat, Inc. website</a>.</p>

                </div>
            </div>

            <div class="logos">
                <a href="http://nginx.net/"><img
                    src="nginx-logo.png" 
                    alt="[ Powered by nginx ]"
                    width="121" height="32" /></a>
                <a href="http://www.redhat.com/"><img
                    src="poweredby.png"
                    alt="[ Powered by Red Hat Enterprise Linux ]"
                    width="88" height="31" /></a>
            </div>
        </div>
    </body>
</html>
thor@jump-host ~$
```
<img width="2318" height="1173" alt="image" src="https://github.com/user-attachments/assets/974e5b3d-fa69-4342-beff-3c627e92c351" />
<img width="963" height="908" alt="image" src="https://github.com/user-attachments/assets/4f7354ed-7b5d-4c75-ae58-ff52488e9f20" />

