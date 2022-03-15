# docker_scantailor

Docker images for [ScanTailor](http://scantailor.org/) and [ScanTailor Advanced](https://github.com/4lex4/scantailor-advanced).

## Usage, CLI

A data volume is defined at `/data` to use as a host-mapped data volume:

```
docker run -v $(pwd):/data -ti ryanfb/scantailor scantailor-cli --help
```

Note that [ScanTailor Advanced is currently missing the `scantailor-cli` interface](https://github.com/4lex4/scantailor-advanced/issues/1).

## Usage, GUI

You can also use [X11 forwarding](https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc) to run the ScanTailor GUI:

```
docker run -v $(pwd):/data -e DISPLAY=192.168.0.235:0 ryanfb/scantailor:advanced scantailor
```

More details follow.

### Configuration and building

There's a `Makefile` for Macs and Scantailor-Advanced.

`make deps` uses Homebrew to install [XQuartz](https://www.xquartz.org) and socat.

Configuring XQuartz, per [cntnr.io](https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc):
> Now open up the preferences from the top menu and go to the last tab 'security'.
> There we need to make sure the "allow connections from network clients" is checked "on".

Before using XQuartz, log out of the OS and log back in.

`make build-scantailor-advanced` will build the Docker image, which includes downloading dependencies and building the app.
This can take a few minutes.

### Running

In order:

1. `make run-tunnel` launches the socat tunnel.
Leave this open and running. In another terminal:
2. `make run-xquartz` launches Xquartz.
3. `make run-scantailor-advanced` launches Scantailor Advanced.

### "Early Access" builds

There are also builds for the "Early Access" release of ScanTailor Advanced, as well as the latest git revision. You can use these by replacing `advanced` in the above instructions with `earlyaccess` and `head`, respectively.

## Why?

There's no longer a Mac Homebrew package for ScanTailor and this was the "easiest" way to get both it and ScanTailor Advanced working.
