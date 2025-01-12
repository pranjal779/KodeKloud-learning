```sh
yum install httpd

service httpd start

service httpd status

firewall-cmd --permanent --add-service=http

```

## View Logs

```sh
cat /var/log/httpd/access_log

cat /var/log/httpd/error_log
```
## config file

/etc/httpd/cof/httpd.conf




