# docker_scantailor

Docker images for [ScanTailor](http://scantailor.org/) and [ScanTailor Advanced](https://github.com/4lex4/scantailor-advanced).

## Usage

A data volume is defined at `/data` to use as a host-mapped data volume:

    docker run -v $(pwd):/data -ti ryanfb/scantailor scantailor-cli --help

You can also use [X11 forwarding](https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc) to run the ScanTailor GUI:

    docker run -v $(pwd):/data -e DISPLAY=192.168.0.235:0 ryanfb/scantailor:advanced scantailor

Note that [ScanTailor Advanced is currently missing the `scantailor-cli` interface](https://github.com/4lex4/scantailor-advanced/issues/1).

## Why?

There's no longer a Mac Homebrew package for ScanTailor and this was the "easiest" way to get both it and ScanTailor Advanced working.
