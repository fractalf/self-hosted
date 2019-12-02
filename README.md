Stuff I'm self-hosting..

Remember to edit `.env`

Feel free to create an issue or contact me on [mastadon](https://freeradical.zone/@alf) if you need help or discover a bug/typo/improvement

# Nginx Proxy

All servers I'm running is behind a nginx proxy handeling SSL (w/ Let's Encrypt). I'm using [this excelent repo](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion) to set things up real easy.

You want to have your own domain to make things easy on your self.

If you have a router in front of your LAN you need to NAT 80/443 to your mean self-hosted machine. Also some services might require other ports which you need to NAT (example gitea ssh access)

# Gitea

https://gitea.io/

Got some sensitive data you don't trust Github with? This is a super sweet open source git repo hosting server where you have full control of your data. It has all you need to host your own repos and the GUI is quite similar to Github (I'll give them that, they have excellent GUI).

# Radicale

https://radicale.org/

Sick of storing all your contacts at Google? Well I certainly was, so I installed this free and open-source CalDAV/CardDAV server to host my contacts.

I modified the official Dockerfile a bit

* Don't run as root!
* Changed some paths

I made a small `git.sh` script to make the whole git thing run more smoothly.

**Important!**

You need to make a file `./config/users` containing users/passwords. This is as easy as:

```
htpasswd -B -C 10 users <user>
```

I'm using [this open-source Android app](https://www.davx5.com) to sync my contacts.

# Resilio

https://www.resilio.com/

Don't sell out your precious data to Google or other blood suckers like them. Backup your phone data and share files with others from your own server!

