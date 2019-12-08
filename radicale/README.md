# Links

* https://radicale.org/
* https://github.com/Kozea/Radicale
* https://www.davx5.com/ (android app)

# Changes

I modified the official Dockerfile a bit

* Don't run as root!
* Changed some paths

I made a small `git.sh` script to make the whole git thing run more smoothly.

# Create users

Create users (using bcrypt with computing time 10)

```sh
$ htpasswd -B -C 10 config/users <user>
```

# Start containers

```sh
$ docker-compose up -d
```

Check that things are running

```sh
$ docker-compose logs -f
```
