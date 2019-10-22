#!/bin/sh

# backup
sudo -u postgres pg_dump db_name | xz > backup.sql.xz

# restore
xz -cd backup.sql.xz | sudo -u postgres psql db_name
