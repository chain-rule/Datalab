include config.mk

instance := ${image}-$(shell echo '${user}' | tr '[:upper:]. ' '[:lower:]--')

all: connect

build:
	docker rmi ${image} || true
	docker build --tag ${image} .
	docker tag ${image} ${registry}/${project}/${image}
	docker push ${registry}/${project}/${image}

connect:
	datalab connect ${instance}

create:
	datalab create \
		--image-name ${registry}/${project}/${image} \
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
