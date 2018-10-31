image ?= datalab
machine ?= n1-standard-8
project ?= $(shell gcloud config get-value project)
registry ?= eu.gcr.io
user ?= ${USER}
zone ?= europe-west4-a
