ifndef project
$(error The project variable must be defined)
endif

name ?= workhorse
user ?= ${USER}

hub ?= eu.gcr.io
machine ?= n1-standard-8
zone ?= europe-west4-a

image := ${name}
instance := ${name}-$(shell echo '${user}' | tr '[:upper:]. ' '[:lower:]--')

all: connect

build:
	docker rmi ${image} || true
	docker build --tag ${image} .
	docker tag ${image} ${hub}/${project}/${image}
	docker push ${hub}/${project}/${image}

connect:
	datalab connect ${instance}

create:
	datalab create \
		--image-name ${hub}/${project}/${image} \
		--machine-type ${machine} \
		--no-backups \
		--zone ${zone} \
		${instance}

delete:
	datalab delete \
		--delete-disk \
		--quiet \
		${instance}

ssh:
	gcloud compute ssh \
		${instance} -- ' \
		docker exec \
			--interactive \
			--tty \
			$$(docker ps | grep ${image} | cut -d" " -f1) \
			script /dev/null'

stop:
	datalab stop ${instance}

.PHONY: all build connect create delete ssh stop
