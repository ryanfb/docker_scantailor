.PHONY: deps build-scantailor-advanced build-scantailor-earlyaccess build-scantailor-head run-tunnel run-xquartz run-scantailor-advanced run-scantailor-earlyaccess run-scantailor-head

deps:
	brew install socat xquartz

build-scantailor-advanced:
	docker build -f Dockerfile.advanced .

build-scantailor-earlyaccess:
	docker build -f Dockerfile.earlyaccess .

build-scantailor-head:
	docker build -f Dockerfile.head .

run-tunnel:
	socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"${DISPLAY}\"

run-xquartz:
	open -a Xquartz

run-scantailor-advanced:
	docker run -v $(CURDIR):/data \
		-e DISPLAY=host.docker.internal:0 \
		$(shell docker build -q -f Dockerfile.advanced .)

run-scantailor-earlyaccess:
	docker run -v $(CURDIR):/data \
		-e DISPLAY=host.docker.internal:0 \
		$(shell docker build -q -f Dockerfile.earlyaccess .)

run-scantailor-head:
	docker run -v $(CURDIR):/data \
		-e DISPLAY=host.docker.internal:0 \
		$(shell docker build -q -f Dockerfile.head .)
