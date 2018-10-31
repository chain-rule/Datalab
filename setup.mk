project ?= $(shell gcloud config get-value project)
user ?= ${USER}

image ?= datalab
registry ?= eu.gcr.io

machine ?= n1-standard-8
zone ?= europe-west4-a
