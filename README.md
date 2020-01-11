# Datalab

The repository provides scripts for building and using a custom [Datalab] image.

## Installation

Adjust the configuration:

```sh
vim Dockerfile Makefile requirements.txt run.sh
```

Build a custom Datalab image and upload it to Container Registry:

```sh
make build
```

## Usage

Create an instance in Compute Engine and connect to Datalab:

```sh
make create
```

Stop the instance:

```sh
make stop
```

Connect to Datalab, resuming the instance if needed:

```sh
make connect
```

Connect to the instance via SSH:

```sh
make shell
```

Delete the instance:

```sh
make delete
```

[datalab]: https://cloud.google.com/datalab
