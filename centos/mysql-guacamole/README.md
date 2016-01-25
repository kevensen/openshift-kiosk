In order to use this container, you'll have to import the initdb.sql script.

For OpenShift, using the OC cli.

1.) oc exec -it <mysql-pod> /bin/bash

2.)  mysql -u root guacdb < /initdb.sql
