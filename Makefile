CURRENT_UID=$$(id -u $$USER)
CURRENT_DIR=$$(pwd)
TERM_CACHE_DIR=$(CURRENT_DIR)/.term-cache
IMAGE_TAG=shiroyuki/timelinejs

package:
	node_modules/webpack/bin/webpack.js $(PACKAGE_EXT)

build-term:
	docker build --build-arg UID=$(CURRENT_UID) -t $(IMAGE_TAG) .

term:
	mkdir -p .term-cache
	docker run \
		-it \
		--rm \
		--privileged \
		-h timelinejs \
		-v $(CURRENT_DIR):/opt \
		-v $(TERM_CACHE_DIR):/home/developer \
		-u $(CURRENT_UID) \
		$(IMAGE_TAG) $(CLI)

ownership-fix-shiroyuki-danbo:
	chown -Rf $$USER:master .
