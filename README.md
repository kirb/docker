# Docker Stuff
Some Docker thingies I’ve made.

## pxeboot
Ready-to-go PXE server that boots into iPXE. Just set your host’s static IP address in dnsmasq.conf and run:

```shell
cd pxeboot
docker build .
docker run -it \
	--net=host \
	-v $PWD/config:/config \
	abcdef123456
```

(Substitute the image identifier from the output of the build command in the run command.)
