# Links

* https://gitea.io/
* https://github.com/go-gitea/gitea
* https://hub.docker.com/r/gitea/gitea

# Start containers

```sh
$ docker-compose up -d
```

Check that things are running

```sh
$ docker-compose logs -f
```

# Add user

Since we disabled user registration we need to create a user by using the gitea cli

```sh
$ docker-compose exec <container> /bin/bash

$ gitea --help
$ gitea admin --help
$ gitea admin create-user --help

$ gitea admin create-user --admin --username <user> --password <tmp pass> --must-change-password --email <email>
```

# Customize config

Some config values can be set in `docker-compose.yml`, but not all so this is a good time to add some more.

The config file will be located here: `<DATA_PATH>/gitea/conf/app.ini`


```ini
[ui]
; Use the build in dark theme
DEFAULT_THEME = arc-green
```

# Customize templates

It's nice to be able to customize how things are going to look. I removed some stuff I didn't want the world to see.

```sh
$ mkdir -p <DATA_PATH>/gitea/templates/base

$ cp ./gitea/head_navbar.tmpl <DATA_PATH>/gitea/templates/base/
```

# Restart container

You need to restart the container to apply the new config and template override.

```sh
$ docker-compose restart
```

# Extra

Somethings can't be changed from the GUI or config. Then we need to edit the database directly.

Example: change a users theme

```sql
sqlite> select id,name,theme from user;
1|foobar|gitea
sqlite> update user set theme='arc-green' where id=1;
sqlite> select id,name,theme from user;
1|foobar|arc-green
```
