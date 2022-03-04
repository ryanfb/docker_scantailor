.PHONY: deps build-scantailor-advanced run-tunnel run-xquartz run-scantailor-advanced

deps:
	brew install socat xquartz

build-scantailor-advanced:
	docker build -f Dockerfile.advanced .

run-tunnel:
	socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"${DISPLAY}\"

run-xquartz:
	open -a Xquartz

run-scantailor-advanced:
	docker run -v $(CURDIR):/data \
		-e DISPLAY=host.docker.internal:0 \
		$(shell docker build -q -f Dockerfile.advanced .)
