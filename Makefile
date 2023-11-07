
define build
	cd 3.7/$1 && docker build --platform linux/amd64 -t zeroc/$1:latest -f Dockerfile .
endef

define tag
	docker tag zeroc/$1:latest zeroc/$1:3.7
	docker tag zeroc/$1:latest zeroc/$1:3.7.10
endef

define push
	docker push zeroc/$1:latest
	docker push zeroc/$1:3.7
	docker push zeroc/$1:3.7.10
endef

.PHONY:build
build:
	@echo "Building..."
	$(call build,glacier2)
	$(call build,icegridnode)
	$(call build,icegridregistry)
	$(call build,icestorm)

.PHONY:tag
tag:
	@echo "Tagging"
	$(call tag,glacier2)
	$(call tag,icegridnode)
	$(call tag,icegridregistry)
	$(call tag,icestorm)

.PHONY:push
push:
	@echo "Pushing..."
	$(call push,glacier2)
	$(call push,icegridnode)
	$(call push,icegridregistry)
	$(call push,icestorm)
