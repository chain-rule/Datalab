build:
	docker rmi ${image} || true
	docker build --tag ${image} .
	docker tag ${image} ${registry}/${project}/${image}
	docker push ${registry}/${project}/${image}

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

shell:
	@gcloud compute ssh \
		--zone ${zone} \
		${instance} -- ' \
		docker exec \
			--interactive \
			--tty \
			$$(docker ps | grep ${image} | cut -d" " -f1) \
			script /dev/null'

start:
	@datalab connect ${instance}

stop:
	@datalab stop ${instance}

.PHONY: build create delete shell start stop
