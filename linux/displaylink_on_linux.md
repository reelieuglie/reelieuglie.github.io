# Notes on Running DisplayLink on Linux 
Run on Arch, currently kernel 6.16.8, using Wayland

## modules-load file
* /etc/modules-load.d/udl.conf
```
udl
```

* /etc/modules-load.d/evdi.conf
```
evdi
```
* Start displaylink service
```
systemctl enable --now displaylink.service
```




## References
[wiki](https://wiki.archlinux.org/title/DisplayLink)
