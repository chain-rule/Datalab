# Datalab

The repository provides scripts for building and using a custom [Datalab] image.

## Installation

Adjust the configuration:

```bash
vim setup.mk setup.sh requirements.txt run.sh
```

Build a custom Datalab image and upload it to Container Registry:

```bash
make build
```

## Usage

Create an instance in Compute Engine and connect to Datalab:

```bash
make create
```

Stop the instance:

```bash
make stop
```

Connect to Datalab, resuming the instance if needed:

```bash
make connect
```

Connect to the instance via SSH:

```bash
make ssh
```

Delete the instance:

```bash
make delete
```

[datalab]: https://cloud.google.com/datalab
