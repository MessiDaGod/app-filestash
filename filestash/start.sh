#!/bin/bash

stopServices() {
        service apache2 stop
        service postgresql stop
}
trap stopServices TERM

# Change Ownership of mounted folder to pstgres user
chown postgres /var/lib/postgresql/12/main

service postgresql start
service apache2 start

# fork a process and wait for it
tail -f /var/log/postgresql/postgresql-12-main.log &
wait
