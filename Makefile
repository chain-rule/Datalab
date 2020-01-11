project ?= $(shell gcloud config get-value project)
user ?= $(shell echo '${USER}' | tr '[:upper:]. ' '[:lower:]--')
registry ?= eu.gcr.io
image ?= datalab-${user}
machine ?= n2-standard-8
zone ?= europe-west1-b

all: start

build:
	docker build --tag ${image} .
	docker tag ${image} ${registry}/${project}/${image}
	docker push ${registry}/${project}/${image}

create:
	datalab create \
		--image-name ${registry}/${project}/${image} \
		--machine-type ${machine} \
		--no-backups \
		--zone ${zone} \
		${image}

delete:
	datalab delete --delete-disk --quiet ${image}

shell:
	@gcloud compute ssh --zone ${zone} ${image} -- \
		'docker exec --interactive --tty $$(docker ps | grep ${image} | cut -d" " -f1) zsh'

start:
	@datalab connect ${image}

stop:
	@datalab stop ${image}

.PHONY: all build create delete shell start stop
