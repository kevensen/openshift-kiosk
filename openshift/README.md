# Deployment in the OpenShift Container Platform
## Deploy a database
1. Create a new project for Guacamole
2. Click "Add to Project"
3. Choose any of the MySQL database templates

## Generate the initial database configuration
1. On your workstation/desktop execute the following
```bash
$ docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql
```
2. Upload the configuration to the MySQL Container

3. Load the SQL file into the database

## Deploy Guacamole
```bash
$ oc create -f guacamole-template.yaml
```
1. Click "Add to Project"
2. Add "guacamole"
3. Ensure you use the same mysql username, password, and database name that you used to deploy the MySQL database

## Access the Application
1. Navigate to the URL, for example...
```
http://guacamole-guacamole.192.168.1.51.xip.io/guacamole
```
2. Login with user name <strong>guacadmin</strong> and password <strong>guacadmin</string>.
3. Enjoy
