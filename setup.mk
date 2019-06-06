project ?= $(shell gcloud config get-value project)
user ?= $(shell echo '${USER}' | tr '[:upper:]. ' '[:lower:]--')

image ?= datalab-${user}
registry ?= eu.gcr.io

instance ?= ${image}
machine ?= n1-standard-8
zone ?= europe-west1-b
