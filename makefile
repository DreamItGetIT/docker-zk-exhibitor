.PHONY: start stop package push-package

IMAGE_NAME := digit/zk-exhibitor

start:
	docker run --name=zk-exhibitor -p 8181:8181 -p 2181:2181 -p 2888:2888 -p 3888:3888 \
		-e CONFIG_TYPE=file \
		-e HOSTNAME=digit \
		$(IMAGE_NAME)

stop:
	docker rm -vf zk-exhibitor || true

package:
	docker build -t $(IMAGE_NAME) .

push-package:
	docker push $(IMAGE_NAME)
